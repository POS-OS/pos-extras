prep() {
  # No committed vendor/: go mod vendor fetches what go.sum names
  # (prep_go_vendor), so the build runs offline.
  prep_go_vendor
}
