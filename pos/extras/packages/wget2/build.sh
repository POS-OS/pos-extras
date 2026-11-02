pkg() {
  # OpenSSL (its default is GnuTLS), HTTP/2 with nghttp2, and zlib, zstd,
  # xz and bzip2 content encoding. Left out, as pos lacks the libraries:
  # libpsl, libhsts, IDN (libidn2), DANE, GPGME, brotli, lzip, libproxy.
  # --disable-doc: no doxygen or pandoc; the release's man page is
  # installed as it is. LDCONFIG=: keeps make install from running
  # ldconfig; wget2_noinstall, a copy of wget2 for the test suite, is
  # removed, as Fedora does.
  pkg_autotools \
    --disable-static \
    --disable-doc \
    --with-ssl=openssl \
    --with-libnghttp2 \
    --with-zlib \
    --with-zstd \
    --with-lzma \
    --with-bzip2 \
    --with-libpcre2 \
    --without-libpcre \
    --enable-xattr \
    --without-libpsl \
    --without-libhsts \
    --without-libidn2 \
    --without-libidn \
    --without-libdane \
    --without-gpgme \
    --without-brotlidec \
    --without-lzip \
    --without-libmicrohttpd \
    LDCONFIG=:
  rm "${dest_dir}${prefix}/bin/wget2_noinstall"
  ln -s wget2 "${dest_dir}${prefix}/bin/wget"
  install -Dm644 docs/man/man1/wget2.1 "${dest_dir}${prefix}/share/man/man1/wget2.1"
}
