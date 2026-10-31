# git's own Makefile, in the source tree, configured by config.mak. The
# shell and perl the scripts name (#!) are pos' and this prefix's.
# Git.pm and its modules go into the perl's vendor directory, on its
# @INC, as distributions install them. Programs in libexec/git-core are
# symlinks to git, not hardlinks. The manual pages are upstream's
# (git-manpages). Without its Rust part (NO_RUST, optional until git
# 3.0): the toolchain has no Rust yet (pos-sdk, task 22).
pkg() {
  pkg_sync_src
  cat > config.mak <<EOT
prefix = ${prefix}
CC = gcc
CFLAGS = ${CFLAGS}
LDFLAGS = ${LDFLAGS}
SHELL_PATH = ${pos_prefix}/bin/sh
PERL_PATH = ${prefix}/bin/perl
perllibdir = $("${prefix}/bin/perl" -MConfig -e 'print $Config{installvendorlib}')
CURL_CONFIG = ${pos_prefix}/bin/curl-config
USE_LIBPCRE2 = YesPlease
NO_PYTHON = YesPlease
NO_TCLTK = YesPlease
NO_RUST = YesPlease
NO_INSTALL_HARDLINKS = YesPlease
INSTALL_SYMLINKS = YesPlease
EOT
  pkg_compile V=1
  pkg_install
  mkdir -p "${dest_dir}${prefix}/share/man"
  cp -R git-manpages/man1 git-manpages/man5 git-manpages/man7 "${dest_dir}${prefix}/share/man/"
}
