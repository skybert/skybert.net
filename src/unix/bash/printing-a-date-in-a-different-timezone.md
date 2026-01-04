title: Printing a Date in a Different Timezone
date: 2012-10-07
category: bash
tags: bash, unix, linux

Printing dates, or indeed executing any Unix command for a certain
timezone is easily done with setting the `TZ` environment variable.

For your local system, you typically set the timezone in
`/etc/timezone`, but often it's useful to change the timezone just for
executing a command or two, such as priting the date in a different
country.

To print the date in e.g. Oslo when your local timezone is
e.g. 'Asia/Taipei', do (yes on the same line, without any
export or the sort):

```perl
$ TZ='Europe/Oslo' date
```

If you had used an export TZ there, the timezone change would have
"stuck" longer than just the one `date` command.

Another good usecase for setting the `TZ` variable is to [make sure
calls to the Google Calender
CLI](https://www.skybert.net/bash/google-cli/) work.

Happy coding!

