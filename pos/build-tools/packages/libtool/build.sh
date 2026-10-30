# The libtool script records the tools it was configured with: the plain
# names, found in PATH (the sdk's compiler first, pos-link), not one sdk's
# paths or the build container's /usr/bin, and the loader's search path,
# /pos/lib (which needs no rpath), not the build container's ld.so.conf.
pkg() {
  pkg_autotools CC=gcc CXX=g++ LD=ld NM=nm AR=ar RANLIB=ranlib \
    ac_cv_path_SED=sed ac_cv_path_GREP=grep \
    ac_cv_path_EGREP="grep -E" ac_cv_path_FGREP="grep -F" \
    lt_cv_sys_lib_dlsearch_path_spec="${pos_prefix}/lib"
}
