{
  boot.blacklistedKernelModules = [
    #           Obscure network protocols
    "dccp"      # Datagram Congestion Control Protocol
    "sctp"      # Stream Control Transmission Protocol
    "rds"       # Reliable Datagram Sockets
    "tipc"      # Transparent Inter-Process Communication
    "n-hdlc"    # High-level Data Link Control
    "netrom"    # NetRom
    "x25"       # X.25
    "ax25"      # Amateur X.25
    "rose"      # ROSE
    "decnet"    # DECnet
    "econet"    # Econet
    "af_802154" # IEEE 802.15.4
    "ipx"       # Internetwork Packet Exchange
    "appletalk" # Appletalk
    "psnap"     # SubnetworkAccess Protocol
    "p8022"     # IEEE 802.3
    "p8023"     # Novell raw IEEE 802.3
    "can"       # Controller Area Network
    "atm"       # ATM
    "af_key"    # PF_KEY socket family (Legacy IPsec)
    "irda"      # Infrared Data Association (Legacy Wireless)

    #           Old or rare or insufficiently audited filesystems
    "adfs"      # Active Directory Federation Services
    "affs"      # Amiga Fast File System
    "befs"      # "Be File System"
    "bfs"       # BFS, used by SCO UnixWare OS for the /stand slice
    "cifs"      # Common Internet File System
    "cramfs"    # compressed ROM/RAM file system
    "efs"       # Extent File System
    "erofs"     # Enhanced Read-Only File System
    "exofs"     # EXtended Object File System
    "freevxfs"  # Veritas filesystem driver
    "f2fs"      # Flash-Friendly File System
    "vivid"     # Virtual Video Test Driver
    "gfs2"      # Global File System 2
    "hpfs"      # High Performance File System (used by OS/2)
    "hfs"       # Hierarchical File System (Macintosh)
    "hfsplus"   # " same as above, but with extended attributes
    "jffs2"     # Journalling Flash File System (v2)
    "jfs"       # Journaled File System
    "ksmbd"     # SMB3 Kernel Server
    "minix"     # minix fs
    "nfsv3"     # Network File System (v3)
    "nfsv4"     # Network File System (v4)
    "nfs"       # Network File System
    "nilfs2"    # New Implementation of a Log-structured File System
    "omfs"      # Optimized MPEG Filesystem
    "qnx4"      # extent-based file system (QNX4/QNX6)
    "qnx6"      # "
    "squashfs"  # compressed read-only file system
    "sysv"      # Xenix, SystemV/386 and Coherent FS
    "udf"       # Universal Disk Format

    #           Input and modern vulnerabilities
    "joydev"    # Legacy Joystick device interface
    "libceph"   # Ceph Network Protocol
  ];
}
