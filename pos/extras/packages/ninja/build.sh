pkg() {
  # configure.py --bootstrap builds ninja with the compiler and flags of the
  # environment (CXX, else c++: the sdk's), without a ninja or cmake.
  pkg_sync_src
  python3 configure.py --bootstrap
  install -D -m 0755 ninja "${dest_dir}${prefix}/bin/ninja"
}
