# Download JACK and integrate with REAPER

```
alex@eratosthenes:~$ sudo apt-get install jackd
```
Select "Yes" to enable relatime processes.

```
alex@eratosthenes:~$ sudo apt-get install qjackctl
```

I ran qjackctl, selected my audio interface (Behringer UM2), and started Jack. Then I started REAPER. It "just worked". However, the latency is a bit high (about 20ms).

Changing the frames/period to 256 gives 0m/s latency. Note at time of writing my kernel is 

```
alex@eratosthenes:~$ uname -r
6.8.0-41-generic

```

not the lowlatency kernel.

Using the suggested below defaults of

```
> Frames/Period 256
> Sample rate 48000
> Periods/Buffer 2
```

gives me 5.3/10 ms latency which I am fine with.

# Update 20220829 I got it working!!!

Trick was to have `jackd` as the autostart command in preferences. This gives 0ms latency
And maybe `qjackctl`?

# How to hook up JACK with REAPER (linux version)

```
Start JACK with 
qjackctl 
Press "Start"
Make sure the audio interface is plugged in. Type 
alex@escher:~$ cat /proc/asound/cards
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xed518000 irq 180
 1 [CODEC          ]: USB-Audio - USB Audio CODEC
                      Burr-Brown from TI USB Audio CODEC at usb-0000:00:14.0-1, full speed

and find the audio interface - in this case it's 1 [CODEC
press the "Setup" button on the JACK GUI, and go to Interface - select the audio interface (CODEC in this case)
you can probably play with the frames/period - lowering this -> lower latency
open reaper (linux version)
Go to Options > Preferences > Audio > Device
Select Audio System = Jack
At this stage I have 5.3/10ms latency (what do these two latencies mean?)
```

256 frames/period gives 5.3/10 ms latency, which is OK

# Start JACK with qjackctl

Default settings had ~ 46ms latency. 

https://linuxmusicians.com/viewtopic.php?t=13319 :

> Too high for some things, try to get 10 or less. Imagine each ms as being one foot away from an amp/speaker. 46 feet away, and the sound takes awhile to reach your ears. Try qjackctl settings
> 
> Frames/Period 256
> Sample rate 48000
> Periods/Buffer 2
> 
> should be near '10 feet away', not a big deal on stage. These can be adjusted according to task. Rendering, as math functions, has a different requirement than recording live jamming riffs, so 46 might be better for mastering lots of fx.

Now the latency is ~ 10 seconds.

Now I can't get sound coming out.

Note interface is set for hw:PCH,0. If I try hw:PCH it still don't work. If I stop JACK in qjackctl I can get sound. Try 44100k doesn;t work. Driver is currently ALSA

https://askubuntu.com/questions/914463/dummy-output-no-sound-in-ubuntu-16-04
https://www.linuxuprising.com/2018/06/fix-no-sound-dummy-output-issue-in.html
???
