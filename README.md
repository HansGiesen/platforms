SDSoC / Vitis platforms
=======================

Introduction
------------

This repository contains platforms for Xilinx SDSoC and Vitis.  The platforms
should be usable as-is, but we have also provided the sources, such that they
can be modified as needed.

Building and installing a platform typically consists of many steps, and is
highly dependent on your setup.  The instructions below work on our systems,
but we cannot foresee every problem you may encounter.  If you run into
problems, please refer to alternate information sources such as Xilinx manuals.

Provided platforms
------------------

Currently, only the following Linux platforms for SDSoC 2019.1 are provided:
- `pynq`: Platform for Pynq-Z1 board
- `ultra96`: Platform for Ultra96-V2 board
- `zcu102`: Platform for ZCU102 board

Directory organization
----------------------

The platforms are in the `platforms` directory.  The `src` directory contains
the sources used to generate the platforms.  Both directories have
subdirectories that correspond with the SDSoC or Vitis version, e.g., `2019.1`
stands for SDSoC 2019.1.  Each of these subdirectories has a subdirectory for
each platform, e.g., `pynq`.

Hardware requirements
---------------------

To install the platform on a board, the following hardware is needed:
- Target board
- Ethernet cable
- SD-card compatible with target board
- SD-card reader
- USB cables

Software requirements
---------------------

Our scripts to install the platform on a board ran on Ubuntu 18.04.5 LTS.
Other versions of Linux will probably also work.  You will also need a serial
communication program such as `minicom`.

Platform installation instructions
----------------------------------

To install the platform, follow these instructions:
1)  Connect the SD-card reader to your workstation and place the SD-card in the
    reader.
2)  Determine the device file of your SD-card, e.g. `/dev/sda`.  Placing or
    removing the SD-card typically results in a log entry in the kernel log,
    which can be shown with `dmesg`.
3)  Install the platform on the SD-card.  This overwrites everything on the
    SD-card, so make sure that you are using the right device file.
    Installation is done by running `./install.bash <platform type>
    <device file>`.
4)  Place the SD-card in the board.
5)  Make sure that the board boots from the SD-card.  This is often
    accomplished via jumpers.
6)  Connect the board to the host PC via the Ethernet cable and USB cables.
7)  Power up the board.
8)  Connect to the serial port with the Linux console of the board using the
    serial communication program.  The baud rate must be set to 115,200.
    Finding the right serial port is typically a matter of trial-and-error.
9)  Log in on the Linux console to ensure that the platform works.  The default
    username and password are `root`.
10) Set a fixed IP address on the board:
    ```
    ifconfig <interface> <IP address>
    ```
11) Determine the network interface connected to the board on the host PC.
    This typically involves unplugging and plugging the Ethernet cable, and
    observing the output of `ifconfig`.
12) Set a fixed IP address on the same subnet as the IP address of the board on
    the network interface.
13) The tuner assumes that running `ssh <hostname>` is sufficient to log in to
    the board, so add an entry for your board to `~/.ssh/config`, e.g:
    ```
    host <hostname>
      hostname <IP address>
      User root
      StrictHostKeyChecking no
      UserKnownHostsFile=/dev/null
    ```
    You can pick a suitable name for `<hostname>` such as `zcu102_1`.
14) Log in to the board via SSH to check that the Ethernet connection works:
    ```
    ssh <hostname>
    ```

Building requirements
---------------------

To build a platform, the following software is needed:
- Xilinx SDSoC 2019.1
- Xilinx Petalinux 2019.1

Platform building instructions
------------------------------

To build the platform, follow these steps:
1) Set up the environment for SDSoC or Vitis.  Typically, this involves
   sourcing `settings64.sh` in the SDSoC / Vitis installation directory.
2) Set up the environment for Petalinux.  Typically, this involves sourcing
   `settings.sh` in the Petalinux installation directory.
3) Run the makefile in `src/<version>/<platform>`, where `<version>` is the
   Vivado version, and `<platform>` is the target platform.  The output products
   are automatically written to the `platforms` directory.

Questions and feedback
----------------------

Should you encounter problems while building, installing, or using the
platform, or should you have feedback, feel free to contact the authors at
giesen@seas.upenn.edu.  We are happy to hear from you!

