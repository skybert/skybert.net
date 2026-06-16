title: Bluetooth from the CLI on macOS
date: 2025-06-25
category: mac-os-x
tags: mac-os-x

# Turn on and off Bluetooth

```text
$ blueutil --power 0 # off
$ blueutil --power 1 # on
```

## Check the bluetooth profile

```text
❯ system_profiler SPBluetoothDataType | grep -B 9 -A 6 XM4:
          Vendor ID: 0x004C (Apple)
      Connected:
          skybert-HHKB-Hybrid_1:
              Address: DA:A0:C3:01:25:B6
              Vendor ID: 0x04FE
              Product ID: 0x0021
              Battery Level: 100 %
              Minor Type: Keyboard
              Services: 0x400000 < BLE >
          skybert-WH-1000XM4:
              Address: 88:C9:E8:E7:8D:85
              Vendor ID: 0x054C
              Product ID: 0x0D58
              Firmware Version: 2.5.1
              Minor Type: Headset
              Services: 0x800019 < HFP AVRCP A2DP ACL >
```

`Services` is the crucial bit, it shows which Bluetooth profile the
headphones are in.

## List connected Bluetooth devices

To list your connected Bluetooth devices, do:

```text
$ blueutil --connected
address: 50-c2-75-77-8c-d4, connected (master, -31 dBm), not favourite, paired, name: "skybert-Jabra Evolve2 65", recent access date: 2025-06-25 06:22:04 +0000
address: dd-d2-83-e2-74-02, connected (master, 0 dBm), not favourite, paired, name: "skybert-MX Master 3S B", recent access date: 2025-06-25 06:22:04 +0000
```

## Connect to a previously paired device

```text
$ blueutil --connect 50-c2-75-77-8c-d4
```
