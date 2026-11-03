pkg() {
  # The program and its man page, which it makes from its own Markdown.
  # pkg_go_env: the vendored modules, cgo's external linking with the
  # environment's gcc and the POS loader.
  pkg_sync_src
  pkg_go_env
  go build -o go-md2man .
  ./go-md2man -in go-md2man.1.md -out go-md2man.1
  install -D -m 0755 go-md2man "${dest_dir}${prefix}/bin/go-md2man"
  install -D -m 0644 go-md2man.1 "${dest_dir}${prefix}/share/man/man1/go-md2man.1"
}
