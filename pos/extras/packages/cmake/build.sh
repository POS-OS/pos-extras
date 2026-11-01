pkg() {
  # bootstrap builds a minimal cmake with the environment's compiler, which
  # then configures the real one. No Qt or curses dialog, no docs (they
  # need sphinx). The libraries it links are pos', found in /pos, which
  # is not this prefix (CMAKE_PREFIX_PATH); the flags are the
  # environment's (build type None, as pkg_cmake).
  pkg_sync_src
  ./bootstrap \
    --prefix="$prefix" \
    --parallel="$nproc" \
    --system-curl \
    --system-expat \
    --system-zlib \
    --system-bzip2 \
    --system-liblzma \
    --system-zstd \
    --no-system-libarchive \
    --no-system-libuv \
    --no-system-librhash \
    --no-system-jsoncpp \
    --no-system-cppdap \
    --no-qt-gui \
    -- -DBUILD_CursesDialog=OFF \
       -DCMAKE_BUILD_TYPE=None \
       -DCMAKE_PREFIX_PATH="$pos_prefix"
  pkg_compile
  pkg_install
}
