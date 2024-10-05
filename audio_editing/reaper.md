# reaper

I downloaded the Linux version of reaper from https://www.reaper.fm/download.php. Extracted the tarball, and ran (had to enter `sudo` password) the install sh script.

# JACK

see the JACK.md file

# yabridgectl

Repo: https://github.com/robbert-vdh/yabridge

Start by install `wine-staging` as per the instructions on Github. That directed me [here](https://gitlab.winehq.org/wine/wine/-/wikis/Debian-Ubuntu)

```
sudo dpkg --add-architecture i386
```

Noted UVUNTU_CODENAME was `noble`.

```
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources # noble
# installed wine-staging
sudo apt update
sudo apt install --install-recommends winehq-staging
```

This all worked fine. Back to the `yabridge` repo. Followed the Ubuntu instructions, which is basically to download it locally to `~/.local/share`. I then added `~/.local/share/yabridge` to my bash `PATH` environment in `~/.bashrc`.

I tested this by downloading [MT Power Drumkit](https://www.powerdrumkit.com/download76187.php) as a VST3, 64-bit, for Windows. Saved this to `~/Documents/ReaperEffects/windows-for-yabridge`. Then I followed the GH to add this via `yabridgectl`

```
yabridgectl add $HOME/Documents/ReaperEffects/windows-for-yabridge/
yabridgectl sync
# ^ this tried to make me install Wine Mono. I let it do it, but it failed with a "corrupted checksum" error or something. Still seemed to work though.
```

All appears to be working!
