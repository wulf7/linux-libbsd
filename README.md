# linux-libbsd
Shim library that allows some BSD-specific software to be compiled and run under Linuxolator

Currently it supports libinotify andlibudev-devd under FreeBSD 13+.
The library handles following BSD libc functions: devname, devname_r,
kevent, kqueue, strlcat, strlcpy, sysctlnametomib, sysctlbyname.
linux_libbsd.ko kmod is requred to be kld-loaded in to kernel.
Following steps will build and install linux-libbsd:

Load linuxolator kernel modules in to memory

```
$ sudo service linux onestart
```

Install *devel/linux-c7-devtools*

```
$ pkg install linux-c7-devtools
```

Build and install *linux-libbsd*

```
$ cd linux-libbsd
$ make
$ sudo make install
```

Load *linux_libbsd* kernel module in to memory

```
$ sudo kldload linux_libbsd
```

To load kernel modules at boot time add some lines to */etc/rc.conf*

```
$ sudo sysrc linux_enable=YES
$ sudo sysrc kld_list+=linux_libbsd
```
