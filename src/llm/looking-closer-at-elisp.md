title: Looking closer at Claude Generated Lisp Code
date: 2026-05-22
category: llm
tags: llm, emacs

I wanted to optimise the way the dape debugger in Emacs works. I
wanted single key navigation, e.g. `n` for next line, `i` for stepping
into, `o` for stepping out and so on. Also wanted the debugger windows
positioned differently, whith the locals browser taking up most of the
vertical space.

After an hour of vibing, testing and re-prompting Claude with the Opus
4.7 model, it solved both use cases, vastly improving my debugging
experience inside of Emacs.

However, in the evening, I decided to look closer at the code it
generated and whether all was necessary. Many years ago, I was fluent
in Lisp programming and although these days, I can only write simple
functions, I'm not afraid of it and am able to hack together features
I need.

## Rendering the debugger info windows

Claude code for rendering the debugger GUI the way I wanted it:

```lisp
  (add-to-list 'display-buffer-alist '((category . dape-info-0) nil (window-width . 60)))
  (add-to-list 'display-buffer-alist '((category . dape-info-1) nil (window-width . 60)))
  (add-to-list 'display-buffer-alist '((category . dape-info-2) nil (window-width . 60)))

  ;; Auto-fit the variable value column to the live window width so the
  ;; locals/watch tables don't overflow. Advice runs per row and rebinds
  ;; `dape-info-variable-table-row-config' for that single render.
  (defun tkj/dape-fit-value-column (orig alist)
    "Auto-size the variable value column to the current dape-info window."
    (let* ((win (get-buffer-window (current-buffer)))
           (w (if win (window-width win) 80))
           (cfg dape-info-variable-table-row-config)
           (name-w (or (alist-get 'name cfg) 0))
           (type-w (or (alist-get 'type cfg) 0))
           ;; Indent prefix + expand handle + column separators.
           (overhead 6)
           (value-w (max 10 (- w name-w type-w overhead)))
           (dape-info-variable-table-row-config
            (mapcar (lambda (c)
                      (if (eq (car c) 'value) (cons 'value value-w) c))
                    cfg)))
      (funcall orig alist)))

  ;; Repaint info buffers when the user drags the side-window divider so
  ;; the value column re-fits the new width.
  (defun tkj/dape-refresh-on-resize (frame)
    (when (and (bound-and-true-p dape--connection)
               (cl-some (lambda (win)
                          (with-current-buffer (window-buffer win)
                            (derived-mode-p 'dape-info-parent-mode)))
                        (window-list frame)))
      (dape-info-update)))

  ;; Resize the dape info side-windows so dape-info-0 (locals) takes
  ;; ~90% of the side column. Per-slot `(window-height . FRACTION)' on
  ;; `display-buffer-alist' doesn't survive sequential side-window
  ;; creation, so we fix it after dape has displayed all groups.
  (defun tkj/dape-layout-sidebar ()
    (when (memq dape-buffer-window-arrangement '(left right))
      (let* ((side dape-buffer-window-arrangement)
             (sorted
              (sort
               (cl-remove-if-not
                (lambda (w)
                  (and (eq (window-parameter w 'window-side) side)
                       (with-current-buffer (window-buffer w)
                         (derived-mode-p 'dape-info-parent-mode))))
                (window-list nil 'no-mini))
               (lambda (a b)
                 (< (or (window-parameter a 'window-slot) 0)
                    (or (window-parameter b 'window-slot) 0))))))
        (when (>= (length sorted) 2)
          (let* ((n (length sorted))
                 (total (cl-loop for w in sorted sum (window-total-height w)))
                 (rest-each (max 3 (floor (* 0.1 total) (1- n)))))
            ;; Shrink the secondary windows from bottom-up; freed lines
            ;; flow into the predecessor sibling, accumulating in the
            ;; locals window (top of chain). Resizing locals directly
            ;; redistributed lines unpredictably across both siblings.
            (dolist (w (reverse (cdr sorted)))
              (let ((delta (- rest-each (window-total-height w))))
                (unless (zerop delta)
                  (ignore-errors
                    (let ((window-size-fixed nil))
                      (window-resize w delta nil t)))))))))))

    (add-hook 'dape-start-hook
              (lambda () (run-with-timer 0 nil #'tkj/dape-layout-sidebar))
              t)
    (advice-add 'dape-quit :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
    (advice-add 'dape-kill :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
    (advice-add 'dape--info-locals-table-columns-list
                :around #'tkj/dape-fit-value-column)
```

After inspecting the code and hand editing everything, I discovered I
really only needed this bit:

```lisp
  (add-to-list 'display-buffer-alist '((category . dape-info-0)
                                       (display-buffer-in-side-window)
                                       (window-height . 0.8)
                                       (window-width . 0.3)))
  (add-to-list 'display-buffer-alist '((category . dape-info-1)
                                       (display-buffer-in-side-window)
                                       (window-height . 0.2)
                                       (window-width . 0.3)))
  (add-to-list 'display-buffer-alist '((category . dape-info-2)
                                       (display-buffer-in-side-window)
                                       (window-height . 0.1)
                                       (window-width . 0.3)))
```

## Single character navigation shortcuts 

Claude designed an advanced feature, with a new minor mode which kept
track of the read only state of each buffer visisted, to ensure the
user could type a single key without editing the actual buffer:

```lisp
  (defvar-keymap dape-session-map
    :doc "Keymap active during a dape debug session."
    "n" #'dape-next
    "i" #'dape-step-in
    "o" #'dape-step-out
    "c" #'dape-continue
    "p" #'dape-pause
    "R" #'dape-restart
    "b" #'dape-breakpoint-toggle
    "q" #'dape-quit)
    
  (define-minor-mode tkj/dape-session-mode
    "Active for the lifetime of a dape debug session.
Provides single-key debugger commands and makes the buffer read-only
so those keys never accidentally edit code. Restores prior writability
on exit."
    :keymap dape-session-map
    (cond
     (tkj/dape-session-mode
      (when (and buffer-file-name (not buffer-read-only))
        (setq-local tkj/dape--restore-writable t)
        (read-only-mode 1)))
     ((bound-and-true-p tkj/dape--restore-writable)
      (read-only-mode -1)
      (kill-local-variable 'tkj/dape--restore-writable))))

  (defun tkj/dape-toggle-all (on)
    "Toggle `tkj/dape-session-mode' in every file buffer."
    (interactive (list (not (bound-and-true-p tkj/dape-session-mode))))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when buffer-file-name
          (tkj/dape-session-mode (if on 1 -1))))))

  ;; Defer hook/advice setup until dape has actually loaded — otherwise
  ;; `add-hook' creates `dape-start-hook' before dape's defcustom runs,
  ;; clobbering the default `(dape-repl dape-info)' value and leaving
  ;; the session without info/repl windows.
  (with-eval-after-load 'dape
    (add-hook 'dape-start-hook (lambda () (tkj/dape-toggle-all t)))
    ;; Catches files reached via step-in that weren't open at start.
    (add-hook 'dape-display-source-hook
              (lambda () (when buffer-file-name (tkj/dape-session-mode 1))))
    ;; dape 0.27.1 has no termination hook, so advise quit/kill directly.
    (advice-add 'dape-quit :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
    (advice-add 'dape-kill :after (lambda (&rest _) (tkj/dape-toggle-all nil)))
```

However, as all experienced Emacs users know, a mode key map has two
features: First, it's only available within a mode. In this case that
meant while the dape mode was active, i.e. the debugging session.  And
secondly, it'll listen for keys in that keymap. The key press will not
travel/register passed that registered shortcut.
  
Thus, all that advanced elisp code wasn't needed. I only needed the
key map istelf, adding it to the correct debugger hook and restoring
the default hook afterwards:

```lisp
  (defvar-keymap dape-session-map
    :doc "Dape keymap for blazingly fast navigation."
    "b" #'dape-breakpoint-toggle
    "c" #'dape-continue
    "i" #'dape-step-in
    "n" #'dape-next
    "o" #'dape-step-out
    "p" #'dape-pause
    "q" #'dape-quit
    "r" #'dape-restart
    )

  (add-hook 'dape-on-start-hook
            (lambda ()
              (use-local-map (copy-keymap dape-session-map))))
  (add-hook 'dape-on-stopped-hook
            (lambda ()
              (use-local-map (default-value 'keymap))))
    
```

# Conclusion

I'm happy I spent some time reading the AI generated code. The
simplified lisp code still gives me the features I want, I have
written it myself so I understand it fully rather than "Yes, that
looks about right", and perhaps most importantly: There's less Lisp
code now, making my Emacs configuration easier to maintain.
