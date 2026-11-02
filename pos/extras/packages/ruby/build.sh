# The plain gcc, g++ and binutils (the sdk's, pos-link's PATH): RbConfig
# records them for the native gems built later, so not this sdk's path.
# The bundled gems' build logs (mkmf.log), which name the build tree, are
# left out. No YJIT or ZJIT: they need Rust, which the toolchain has not
# yet (pos-sdk, task 22). No rdoc or ri indexes (the bundled rdoc makes
# them on request).
pkg() {
  pkg_configure CC=gcc CXX=g++ AR=ar LD=ld NM=nm RANLIB=ranlib \
    --enable-shared \
    --disable-yjit \
    --disable-zjit \
    --disable-install-doc \
    --with-gmp
  pkg_compile
  pkg_install
  find "${dest_dir}${prefix}/lib/ruby/gems" -name mkmf.log -delete
}
