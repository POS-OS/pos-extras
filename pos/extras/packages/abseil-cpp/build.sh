pkg() {
  # Shared libraries (libabsl_*.so), C++17 as protobuf builds with, no
  # tests. The installed cmake configuration records the standard
  # (ABSL_PROPAGATE_CXX_STD), so what links it compiles alike.
  pkg_cmake \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_CXX_STANDARD=17 \
        -DABSL_PROPAGATE_CXX_STD=ON \
        -DABSL_BUILD_TESTING=OFF
}
