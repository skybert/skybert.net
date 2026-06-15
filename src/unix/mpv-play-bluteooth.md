title: Make mpv play on your bluteooth speaker
date: 2026-06-15
category: unix
tags: unix

First, find available output devices:

```text
$ mpv --audio-device=help
List of detected audio devices:
  'auto' (Autoselect device)
  'coreaudio/220EF936-0000-0000-0420-0104A5502178' (HP P34hc G4)
  'coreaudio/88-C9-E8-E7-8D-85:output' (skybert-WH-1000XM4)
  'coreaudio/BuiltInSpeakerDevice' (MacBook Pro Speakers)
  'avfoundation/220EF936-0000-0000-0420-0104A5502178' (HP P34hc G4)
  'avfoundation/88-C9-E8-E7-8D-85:output' (skybert-WH-1000XM4)
  'avfoundation/BuiltInSpeakerDevice' (MacBook Pro Speakers)
```

Then, specify the one you want in the call to `mpv`:
```
$ mpv --audio-device='coreaudio/88-C9-E8-E7-8D-85:output' file.mp3
```

Happy listening!
