# make's default $(CXX) is the configure-time CXX: the plain name, not the
# path of the sdk make was built with.
pkg() {
  pkg_autotools CXX=g++
}
