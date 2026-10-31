# The whole tree, as gettext-tools builds on gettext-runtime's
# directories; the run-time programs it installs here too are the same
# as pos'. pos' libunistring; no ACLs or extended attributes (msgcat
# and friends copy files; libattr would be found when present), Java, C#
# or Emacs.
pkg() {
  pkg_autotools \
    --disable-static \
    --disable-acl \
    --disable-xattr \
    --disable-java \
    --disable-csharp \
    --without-emacs \
    --with-libunistring-prefix=/pos
}
