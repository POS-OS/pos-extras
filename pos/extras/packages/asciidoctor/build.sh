# The gem is built from the source (its gemspec lists the files without
# git) and installed offline into Ruby's gem directory, with the
# asciidoctor command in bin and its man page.
pkg() {
  pkg_sync_src
  gem build asciidoctor.gemspec
  gem install --local --no-document --ignore-dependencies \
    --install-dir "${dest_dir}$(ruby -e 'print Gem.default_dir')" \
    --bindir "${dest_dir}${prefix}/bin" \
    asciidoctor-*.gem
  install -Dm644 man/asciidoctor.1 "${dest_dir}${prefix}/share/man/man1/asciidoctor.1"
}
