title: Create Dockerfile to Run Go and Playwright 
date: 2026-03-25
category: llm
tags: llm, go

I needed a `Dockerfile` that had both `go` and `playwright`. Claude Code suggested several things, like generating a Go file to install the OS (!) dpeendencies:

```go
+ENV PLAYWRIGHT_DRIVER_PATH=/opt/ms-playwright-go
+ENV PLAYWRIGHT_BROWSERS_PATH=/opt/ms-playwright
+
+RUN <<EOF bash
+cat > /tmp/install_playwright.go << 'GOEOF'
+//go:build ignore
+
+package main
+
+import pw "github.com/playwright-community/playwright-go"
+
+func main() {
+	if err := pw.Install(&pw.RunOptions{
+		Browsers: []string{"chromium"},
+	}); err != nil {
+		panic(err)
+	}
+}
+GOEOF
+cd /home/foo/go-test-automation-suite && go run -mod=vendor /tmp/install_playwright.go
+# Install OS-level dependencies for Chromium using the bundled playwright CLI
+/opt/ms-playwright-go/node /opt/ms-playwright-go/package/cli.js install-deps chromium
```

It also suggested creating fake packages to satisify a DEB dependency:

```perl
RUN mkdir -p /tmp/fake-ttf-unifont/DEBIAN \
    && printf "Package: ttf-unifont\nVersion: 1.0\nArchitecture: all\nMaintainer: dummy\nDescription: dummy\n" \
       > /tmp/fake-ttf-unifont/DEBIAN/control \
    && dpkg-deb --build /tmp/fake-ttf-unifont /tmp/ttf-unifont.deb \
    && dpkg -i /tmp/ttf-unifont.deb \
    && mkdir -p /tmp/fake-ttf-ubuntu-font-family/DEBIAN \
    && printf "Package: ttf-ubuntu-font-family\nVersion: 1.0\nArchitecture: all\nMaintainer: dummy\nDescription: dummy\n" \
       > /tmp/fake-ttf-ubuntu-font-family/DEBIAN/control \
    && dpkg-deb --build /tmp/fake-ttf-ubuntu-font-family /tmp/ttf-ubuntu-font-family.deb \
    && dpkg -i /tmp/ttf-ubuntu-font-family.deb \
    && playwright install-deps chromium
```


When I finally used my brain and took a look at [the upstream documentation](https://github.com/playwright-community/playwright-go/blob/main/Dockerfile.example#L23), I ended up with a much neater solution:

Use `ubuntu:noble` instead of `debian:trixie`:
```conf
FROM ubuntu:noble
```

Install Playwright in two steps, one as `root` and just the drivers as the unprivileged user:

```perl
RUN PWGO_VER=$(grep -oE "playwright-go v\S+" /home/foo/go-test-automation-suite/go.mod | sed 's/playwright-go //') \
    && go install github.com/playwright-community/playwright-go/cmd/playwright@${PWGO_VER} \
    && playwright install --with-deps

USER foo
RUN playwright install chromium
```




