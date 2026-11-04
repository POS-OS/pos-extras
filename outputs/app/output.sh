# The extras' bin on PATH. They link pos's libraries of the pos release
# line they are built on (the pos reference's product version), and the
# gcc-runtime of the toolchain that compiled them, or a newer one
# (BUILD.md "Extras").
output() {
  local gcc line
  gcc=$(app_ref_version toolchain gcc-runtime) || exit 1
  line=$(app_ref_info pos product-version) || exit 1
  app_make "path bin" "requires gcc-runtime >= $gcc" "requires os = $line"
}
