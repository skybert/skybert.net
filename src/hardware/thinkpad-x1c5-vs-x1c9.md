title: This is how much faster Thinkpad X1 Carbon Gen 9 is than Gen 5
date: 2021-05-04
category: various
tags: hardware, speed, maven, java

## Compile large Java project

```bash
for i in 1 2 3 4 5; do s=$(date +%s); mvn -o clean install &>> /tmp/log; echo $(( $(date +%s) - s )) seconds; done
```
### X1 Gen 5
```text
452 seconds
458 seconds
469 seconds
476 seconds
481 seconds
```

### X1 Gen 9

```text
308 seconds
293 seconds
328 seconds
307 seconds
302 seconds
```

## Compile large Java project using 8 threads

```bash
for i in 1 2 3 4 5; do s=$(date +%s); mvn -o clean install -T 8 &>> /tmp/log; now=$(date +%s); echo $(( now - s )) seconds; done
```
### X1 Gen 5
```text
405 seconds
402 seconds
407 seconds
396 seconds
401 seconds
```

### X1 Gen 9

```text
257 seconds
265 seconds
310 seconds
280 seconds
280 seconds
```
