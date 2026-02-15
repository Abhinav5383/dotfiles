It removes the headphone GPIO inversion in [sof_es8336.c#L123](./sof_es8336.c#L123) added by this commit https://github.com/torvalds/linux/commit/213c4e51267fd825cd21a08a055450cac7e0b7fb

This commit is present after 6.18.8-arch2 i.e. from 6.18.9-arch1 build on ArchLinux.

### Context:
On linux kernel versions after this commit the speaker stops working on mute/unmute on my device (Infinix X2 Plus - i3 1115G4).
This happened quite often even before this commit, but now it happens 100% of the time. \
Plus previously I could get sound back just by switching output profiles through pavucontrol or a [script](/.config/hypr/scripts/fix-speaker.sh). \
But now switching profiles doesn't do anything
rather now it makes the sound go away if I switch profile when I still have functional sound

[more info here](https://github.com/Abhinav5383/infinix-x2-audio-fix/blob/main/COMMON_ISSUES.md#q-the-speaker-randomly-stops-working)

After the sound is gone, the only option to bring it back is a reboot


### Installing this module
- Copy it to the /usr/src directory `sudo cp -r ./es8336-fix /usr/src/es8336-fix-1.0`
- Add this module 
```sh
sudo dkms add -m es8336-fix -v 1.0
```

- Build it 
```sh
sudo dkms build -m es8336-fix -v 1.0
```

- Then install it 
```sh
sudo dkms install -m es8336-fix -v 1.0
```
