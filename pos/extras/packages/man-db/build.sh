pkg() {
  # The programs it runs are named with their paths, so configure does
  # not record the build container's or the build tools': groff's in this
  # prefix, less, col and the compressors in /pos. The configuration is
  # in the prefix (share/man-db), not /etc: pos-extras installs nothing
  # outside it. No setuid man and no cache owner; apropos and whatis need
  # the index mandb makes (/var/cache/man).
  local p=${pos_prefix}/bin
  pkg_autotools \
    --disable-static \
    --disable-setuid \
    --disable-cache-owner \
    --with-db=gdbm \
    --with-config-file="${prefix}/share/man-db/man_db.conf" \
    --with-pager="$p/less" \
    --with-col="$p/col" \
    --with-gzip="$p/gzip" \
    --with-bzip2="$p/bzip2" \
    --with-xz="$p/xz" \
    --with-nroff="${prefix}/bin/nroff" \
    --with-eqn="${prefix}/bin/eqn" \
    --with-neqn="${prefix}/bin/neqn" \
    --with-tbl="${prefix}/bin/tbl" \
    --with-pic="${prefix}/bin/pic" \
    --with-refer="${prefix}/bin/refer" \
    --with-systemdtmpfilesdir="${prefix}/lib/tmpfiles.d" \
    --with-systemdsystemunitdir="${prefix}/lib/systemd/system"
}
