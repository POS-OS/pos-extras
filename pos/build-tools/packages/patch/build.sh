# ed for ed-style patches, from PATH: POS has none, and not the build
# container's (a plain ED is looked up in PATH at configure).
pkg() {
  pkg_autotools ac_cv_path_ED=ed
}
