pkg() {
  # Without the libyaml extension, rather than setup.py trying it and
  # falling back.
  PYYAML_FORCE_LIBYAML=0 pkg_python
}
