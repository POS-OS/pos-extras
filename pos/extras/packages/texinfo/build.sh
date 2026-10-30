# texindex runs awk from PATH, not the build container's /usr/bin/awk.
pkg() {
  pkg_autotools ac_cv_path_TI_AWK=awk
}
