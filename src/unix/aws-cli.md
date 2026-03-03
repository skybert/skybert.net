title: The AWS command line interface
date: 2026-03-03
category: unix
tags: unix, amazon, bash

## Check if you're logged in

To check if you're logged in, you can call this command which lists
information about your AWS user session, or an error if you're not
logged in:

```perl
$ aws sts get-caller-identity
```

