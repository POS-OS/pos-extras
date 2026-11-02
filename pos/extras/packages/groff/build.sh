pkg() {
  # No X11 previewers, URW fonts (gropdf uses the base 14 PDF fonts) or
  # uchardet (preconv guesses no encodings). The scripts name this
  # prefix's perl, not the build tools'.
  pkg_autotools \
    PERL="${prefix}/bin/perl" \
    --without-x \
    --without-urw-fonts \
    --with-uchardet=no \
    --with-compatibility-wrappers=no
}
