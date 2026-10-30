# Sourced by _pkg_setup for builds that require pos-link.
#
# Extras link against /pos and against the extras built before them, in
# the build's prefix (/apps/pos-extras/<version>), whose programs are
# found first. The sdk compiler already searches /pos/include and
# /pos/lib. /pos/include must not be named again: that moves it in front
# of the libstdc++ directories, gcc drops the later duplicate, and
# libstdc++'s #include_next <stdlib.h> then finds nothing after itself.
#
# No -rpath into /pos: the POS loader finds /pos/lib by itself. Its cache
# is /etc/pos/ld.so.cache, not the build container's /etc/ld.so.cache
# (pos's BUILD.md "Core libs stage").
# The sdk's programs come next, so a plain gcc, ld or nm is the sdk's, not
# the build container's Fedora's: tools record the plain names (perl's
# Config cc, the libtool script), which must not name one sdk's path.
export PATH="${prefix}/bin:${sdk_prefix}/bin:$PATH"
export CPPFLAGS="-I${prefix}/include${CPPFLAGS:+ $CPPFLAGS}"
export LDFLAGS="-L${prefix}/lib -L/pos/lib -Wl,--dynamic-linker=/pos/lib/ld-linux-x86-64.so.2${LDFLAGS:+ $LDFLAGS}"
# Replace the host search path so .pc files cannot fall back to /usr.
export PKG_CONFIG_LIBDIR=${prefix}/lib/pkgconfig:/pos/lib/pkgconfig
unset PKG_CONFIG_PATH
