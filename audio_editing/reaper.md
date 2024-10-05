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

# Archetype Nolly plugin

Follwing instructions: [https://downloads.neuraldsp.com/file/archetype-nolly-installers/Archetype-Nolly-v1.0.1.pdf](https://downloads.neuraldsp.com/file/archetype-nolly-x-installers/Archetype%20Nolly%20X%20v1.0.0.pdf)

Downloaded iLok: https://www.ilok.com/#!home. Ran the .exe in using `wine`. It all installed according to the defaults with no issues.

This created a file called `iLok License Manager.desktop` on my Desktop. Not sure what to do with it...

```
alex@eratosthenes:~/Desktop$ wine ./iLok\ License\ Manager.desktop 
002c:fixme:winediag:loader_init wine-staging 9.18 is a testing version containing experimental patches.
002c:fixme:winediag:loader_init Please mention your exact version when filing bug reports on winehq.org.
0048:fixme:heap:RtlSetHeapInformation HEAP_INFORMATION_CLASS 1 not implemented!
0060:fixme:advapi:RegisterEventSourceW ((null),L"Bonjour Service"): stub
0060:fixme:advapi:ReportEventA (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,0000000000B0FA50,0000000000000000): stub
0060:fixme:advapi:ReportEventW (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,00000000006F1F60,0000000000000000): stub
0060:fixme:winsock:WSAIoctl SIO_UDP_CONNRESET stub
0060:fixme:winsock:WSAIoctl SIO_UDP_CONNRESET stub
0060:fixme:advapi:ReportEventA (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,0000000000B0FA50,0000000000000000): stub
0060:fixme:advapi:ReportEventW (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,00000000006F1F60,0000000000000000): stub
0058:fixme:service:svcctl_EnumServicesStatusExW resume handle not supported
0058:fixme:service:svcctl_EnumServicesStatusExW resume handle not supported
0058:fixme:service:svcctl_EnumServicesStatusExW resume handle not supported
0058:fixme:service:svcctl_EnumServicesStatusExW resume handle not supported
0060:fixme:advapi:ReportEventA (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,0000000000B0FA50,0000000000000000): stub
0060:fixme:advapi:ReportEventW (00000000CAFE4242,0x0004,0x0000,0x00000064,0000000000000000,0x0001,0x00000000,00000000006F1F60,0000000000000000): stub
0060:fixme:netapi32:NetGetJoinInformation Semi-stub (null) 0000000000B0FAC8 0000000000B0FAC0
010c:fixme:sync:SetWaitableTimerEx (000000000000014C, 000000000187FB58, 0, 0000000000000000, 0000000000000000, 0000000000000000, 100) semi-stub
00e0:fixme:file:NtLockFile I/O completion on lock not implemented yet
Application could not be started, or no application associated with the specifie
d file.
ShellExecuteEx failed: File not found.
```

Downloaded Archetype: Nolly X (apparently this is an update of Archetype: Nolly). This [link](https://neuraldsp.com/news/introducing-archetype-nolly-x?srsltid=AfmBOoq-xdGgDwmhjRWKbsQMbJ0Ou9EF7JbWjCNgZJHmSGrh-GKOs4_d) says "_The new Archetype: Nolly X plugin is a free update to existing Archetype: Nolly plugin users._"

Ran the .exe. Got a not very helpful screen. Clicked Next. Agreed to the License Agreement by guessing. Got two options which I am guessing is "install for this user" or "install for everyone". Clicked the first, I dunno what it is.
