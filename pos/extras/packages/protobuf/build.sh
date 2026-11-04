pkg() {
  # protoc with its libraries, shared, and the well-known types
  # (include/google/protobuf/*.proto). Abseil is the installed one, never
  # downloaded (protobuf_LOCAL_DEPENDENCIES_ONLY). The upb plugins
  # (protoc-gen-upb*) and libupb.a, which the installed cmake export
  # names, come with protoc whatever protobuf_BUILD_LIBUPB says. No zlib
  # (libprotobuf's gzip streams) or tests.
  pkg_cmake \
        -Dprotobuf_BUILD_SHARED_LIBS=ON \
        -Dprotobuf_BUILD_LIBPROTOC=ON \
        -Dprotobuf_BUILD_LIBUPB=OFF \
        -Dprotobuf_WITH_ZLIB=OFF \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
        -DCMAKE_CXX_STANDARD=17
}
