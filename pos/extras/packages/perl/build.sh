# Configure, not autoconf, in the source tree, with the plain gcc (the
# sdk's, pos-link's PATH): Config records cc, which XS modules built
# later run, so not this sdk's path. Library and header search
# is limited to the build's prefix and /pos: Configure probes /usr/lib
# and /usr/local otherwise, the build container's Fedora (an empty -D is
# ignored, a blank one is not). Threads as
# Fedora, Debian and Arch build it, so modules built for those work.
# What Configure records of the machine (Config.pm: uname, host, user,
# date) is fixed, as are the pager (perldoc) and perl5, which would name
# the build container's. Its other tool paths (ar, sed, ln) are the
# build's own.
pkg() {
  pkg_sync_src
  sh Configure -des \
    -Dprefix="$prefix" \
    -Dvendorprefix="$prefix" \
    -Dsiteprefix="$prefix" \
    -Dman1dir="${prefix}/share/man/man1" -Dman3dir="${prefix}/share/man/man3" \
    -Dsiteman1dir="${prefix}/share/man/man1" -Dsiteman3dir="${prefix}/share/man/man3" \
    -Dvendorman1dir="${prefix}/share/man/man1" -Dvendorman3dir="${prefix}/share/man/man3" \
    -Dman1ext=1 -Dman3ext=3pm \
    -Duseshrplib \
    -Dusethreads \
    -Dinc_version_list=none \
    -Dcc=gcc \
    -Doptimize="$CFLAGS" \
    -Dccflags="$CPPFLAGS" \
    -Dldflags="$LDFLAGS" \
    -Dlddlflags="-shared $LDFLAGS" \
    -Dlibpth="${prefix}/lib ${pos_prefix}/lib" \
    -Dglibpth="${prefix}/lib ${pos_prefix}/lib" \
    -Dplibpth="${pos_prefix}/lib" \
    -Dloclibpth=' ' -Dlocincpth="${prefix}/include" \
    -Dusrinc="${pos_prefix}/include" \
    -Dpager="${pos_prefix}/bin/less -R" -Dperl5="${prefix}/bin/perl" \
    -Dmyuname=linux -Dmyhostname=localhost -Dmydomain=.localdomain \
    -Dcf_by=pos -Dcf_email=root@localhost -Dperladmin=root@localhost \
    -Dcf_time="$(LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH")"
  pkg_compile
  pkg_install
}
