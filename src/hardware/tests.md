date:    2012-10-07
category: various
tags: hardware
title: Hardware tests

Speed tests of hardware I've used.

## Hard drives
### Thinkpad X1 Carbon
- Product: TOSHIBA THNSFJ25
- Vendor: Toshiba
- Version: 1102
- Serial: 15VS10NQTBZW
- Size: 238GiB (256GB)

```perl
# for el in $(seq 0 9); do hdparm -tT /dev/sda; done
/dev/sda:
 Timing cached reads:   12342 MB in  2.00 seconds = 6174.90 MB/sec
 Timing buffered disk reads: 1220 MB in  3.02 seconds = 404.30 MB/sec

/dev/sda:
 Timing cached reads:   12032 MB in  2.00 seconds = 6019.83 MB/sec
 Timing buffered disk reads: 1464 MB in  3.00 seconds = 487.94 MB/sec

/dev/sda:
 Timing cached reads:   13054 MB in  2.00 seconds = 6531.30 MB/sec
 Timing buffered disk reads: 1468 MB in  3.00 seconds = 488.98 MB/sec

/dev/sda:
 Timing cached reads:   13082 MB in  2.00 seconds = 6544.95 MB/sec
 Timing buffered disk reads: 1468 MB in  3.00 seconds = 489.29 MB/sec

/dev/sda:
 Timing cached reads:   13184 MB in  2.00 seconds = 6596.76 MB/sec
 Timing buffered disk reads: 1484 MB in  3.00 seconds = 494.13 MB/sec

/dev/sda:
 Timing cached reads:   13786 MB in  2.00 seconds = 6897.59 MB/sec
 Timing buffered disk reads: 1488 MB in  3.00 seconds = 495.57 MB/sec

/dev/sda:
 Timing cached reads:   14134 MB in  2.00 seconds = 7071.73 MB/sec
 Timing buffered disk reads: 1484 MB in  3.00 seconds = 494.16 MB/sec

/dev/sda:
 Timing cached reads:   13020 MB in  2.00 seconds = 6514.20 MB/sec
 Timing buffered disk reads: 1488 MB in  3.00 seconds = 495.38 MB/sec

/dev/sda:
 Timing cached reads:   14992 MB in  2.00 seconds = 7501.40 MB/sec
 Timing buffered disk reads: 1482 MB in  3.00 seconds = 493.73 MB/sec

/dev/sda:
 Timing cached reads:   14482 MB in  2.00 seconds = 7246.28 MB/sec
 Timing buffered disk reads: 1450 MB in  3.00 seconds = 482.74 MB/sec
```

### MacBook Pro

- Model: "KINGSTON SVP100S"
- Vendor: "KINGSTON"
- Device: "SVP100S"
- Revision: "CJRA"

```perl
# for el in $(seq 0 9); do hdparm -tT /dev/sda; done
/dev/sda:
Timing cached reads:   3312 MB in  2.00 seconds = 1657.53 MB/sec
Timing buffered disk reads: 536 MB in  3.01 seconds = 178.36 MB/sec

/dev/sda:
Timing cached reads:   3402 MB in  2.00 seconds = 1702.14 MB/sec
Timing buffered disk reads: 526 MB in  3.01 seconds = 175.02 MB/sec

/dev/sda:
Timing cached reads:   3500 MB in  2.00 seconds = 1751.70 MB/sec
Timing buffered disk reads: 498 MB in  3.00 seconds = 166.00 MB/sec

/dev/sda:
Timing cached reads:   3534 MB in  2.00 seconds = 1768.13 MB/sec
Timing buffered disk reads: 528 MB in  3.01 seconds = 175.61 MB/sec

/dev/sda:
Timing cached reads:   2856 MB in  2.00 seconds = 1428.59 MB/sec
Timing buffered disk reads: 518 MB in  3.01 seconds = 172.09 MB/sec

/dev/sda:
Timing cached reads:   3160 MB in  2.00 seconds = 1581.28 MB/sec
Timing buffered disk reads: 530 MB in  3.01 seconds = 176.25 MB/sec

/dev/sda:
Timing cached reads:   3350 MB in  2.00 seconds = 1676.07 MB/sec
Timing buffered disk reads: 530 MB in  3.01 seconds = 176.16 MB/sec

/dev/sda:
Timing cached reads:   3538 MB in  2.00 seconds = 1771.00 MB/sec
Timing buffered disk reads: 528 MB in  3.01 seconds = 175.63 MB/sec

/dev/sda:
Timing cached reads:   3636 MB in  2.00 seconds = 1820.14 MB/sec
Timing buffered disk reads: 508 MB in  3.00 seconds = 169.13 MB/sec

/dev/sda:
Timing cached reads:   3262 MB in  2.00 seconds = 1632.11 MB/sec
Timing buffered disk reads: 536 MB in  3.01 seconds = 178.11 MB/sec
```
### Thinkpad X300

- Model: "SAMSUNG MMCRE64G"
- Vendor: "SAMSUNG"
- Device: "MMCRE64G"
- Revision: "VAM0"

```perl
# for el in $(seq 0 9); do hdparm -tT /dev/sda; done
/dev/sda:
Timing cached reads:   5062 MB in  2.00 seconds = 2536.36 MB/sec
Timing buffered disk reads: 150 MB in  3.02 seconds =  49.71 MB/sec

/dev/sda:
Timing cached reads:   4986 MB in  2.00 seconds = 2498.87 MB/sec
Timing buffered disk reads: 150 MB in  3.03 seconds =  49.52 MB/sec

/dev/sda:
Timing cached reads:   4762 MB in  2.00 seconds = 2386.13 MB/sec
Timing buffered disk reads: 150 MB in  3.02 seconds =  49.71 MB/sec

/dev/sda:
Timing cached reads:   5054 MB in  2.00 seconds = 2533.18 MB/sec
Timing buffered disk reads: 150 MB in  3.03 seconds =  49.44 MB/sec

/dev/sda:
Timing cached reads:   5028 MB in  2.00 seconds = 2520.06 MB/sec
Timing buffered disk reads: 150 MB in  3.04 seconds =  49.42 MB/sec

/dev/sda:
Timing cached reads:   4472 MB in  2.00 seconds = 2240.52 MB/sec
Timing buffered disk reads: 150 MB in  3.03 seconds =  49.51 MB/sec

/dev/sda:
Timing cached reads:   5068 MB in  2.00 seconds = 2539.50 MB/sec
Timing buffered disk reads: 150 MB in  3.02 seconds =  49.70 MB/sec

/dev/sda:
Timing cached reads:   4688 MB in  2.00 seconds = 2349.21 MB/sec
Timing buffered disk reads: 150 MB in  3.03 seconds =  49.49 MB/sec

/dev/sda:
Timing cached reads:   5232 MB in  2.00 seconds = 2622.03 MB/sec
Timing buffered disk reads: 150 MB in  3.03 seconds =  49.58 MB/sec

/dev/sda:
Timing cached reads:   5126 MB in  2.00 seconds = 2568.76 MB/sec
Timing buffered disk reads: 150 MB in  3.02 seconds =  49.66 MB/sec
```

