Hardened XPS 2015 Gentoo Config
===============================

About
-----

This repository contains the minimum configuration files to run a hardened Gentoo on the newer XPS model.

I've tested the kernel with the 9343 model. The 9350 model has a newer CPU and chipset and might require slight changes.

Kernel configuration
--------------------

The configuration shouldn't deviate to much from what you'd expect from a standard kernel configuration, except that everything that isn't striclty required has been removed.
This brings the overall build-time to less then 10 minutes on the XPS.

As this is a hardened kernel, please make sure to review the GrSecurity configuration. One thing I personally like is not allowing new USB devices after boot, so you might want
to toggle that flag if you use a lot of different USB devices.

Since 4.8, the configuration has all the necessary settings to support running docker. 

Before running this kernel, make sure to enable module-signing so you get that extra bit of security. Because the wireless driver is being build out-of-tree, disabling module loading
is not an option right now.

bin/make_kernel.sh
------------------

If you don't have an ecrypted harddrive this script is of no concern to you.

For everyone else, please see my blog post for the details. The gist is that the XPS doesn't pass any parameters to UEFI, so if we want to build a signed kernel that is fully
verified by UEFI (without having grub sit in between, which would make the signing useless), the initial ramdisk needs all the parameters required build-in.

Check the script and modify the parameters so they point at your harddisks.
