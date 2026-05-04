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

# Tail logs

Tail Cloudwatch logs, starting from 2 hours ago and keep reading
them, pretty print these JSON log entries, but only the ones that have
level `error`:

```shell
$ aws \
  --profile foo-prod \
  logs \
  tail \
  --follow \
  --since 2h \
  --filter-pattern '{ $.level = "error" }' | 
  srv-bar-api \
  cut -d' ' -f3- | 
  jq
```

The filter works since the JSON log entry blobs have:
```json
{
  "level": "error",
}
```

# See which roles you have

This is how you see the roles your user has in the different accounts
you can access. First, you need to get a hold of your access token and
put it in the `t` variable:

```perl
$ t=$(jq -r .accessToken < ~/.aws/sso/cache/*.json | grep -v null | head -n1)
```

Be sure you're logged in:
```text
$ aws sso login
```

Then, list all account your user has acces to, and for each of these,
list the roles that are assigned to your user:

```bash
$ aws sso list-accounts --access-token $t | 
  jq -r '.accountList[] | .accountId + " " + .accountName' |
  while read -r l; do
    read id name <<< $l;
    echo $id $name
    aws sso list-account-roles --account-id $id --access-token $t;
  done
```

# Expose AWS credentials

Useful for scripts and programs that don't read `~/.aws/sso/cache`

```text
AWS_PROFILE=foo-prod aws configure export-credentials --format env
export AWS_ACCESS_KEY_ID=ASDFAESAFQW
export AWS_SECRET_ACCESS_KEY=aasdfaDFSASDFasdfasdfsdf
export AWS_SESSION_TOKEN=..
```

You can then pipe it to `| sh` to set it in the shell.
