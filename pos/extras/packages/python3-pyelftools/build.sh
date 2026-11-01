pkg() {
  pkg_python
  # Its example readelf.py, not a tool of the extras.
  rm "${dest_dir}${prefix}/bin/readelf.py"
}
