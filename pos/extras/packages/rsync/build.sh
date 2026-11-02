pkg() {
  # Compression with zstd and zlib, checksums with OpenSSL; no lz4, xxhash
  # or IDN (libidn2), which pos lacks: configure stops at an optional
  # library it does not find unless the feature is turned off. The
  # release's man pages are installed as they are (no md2man). No daemon
  # units: a pos-extras rsync is the client and an ssh remote's rsync.
  pkg_autotools \
    --with-included-popt=yes \
    --with-included-zlib=no \
    --enable-zstd \
    --enable-openssl \
    --disable-lz4 \
    --disable-xxhash \
    --enable-acl-support \
    --enable-xattr-support \
    --enable-ipv6 \
    --disable-idn
}
