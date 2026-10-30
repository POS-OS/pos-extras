# The extras' .pc files, then pos's. Flags for /pos itself are the
# system's, which pkgconf leaves out of its output.
pkg() {
  pkg_autotools \
    --with-pkg-config-dir="${prefix}/lib/pkgconfig:${prefix}/share/pkgconfig:${pos_prefix}/lib/pkgconfig:${pos_prefix}/share/pkgconfig" \
    --with-system-libdir="${pos_prefix}/lib" \
    --with-system-includedir="${pos_prefix}/include"
  ln -s pkgconf "${dest_dir}${prefix}/bin/pkg-config"
}
