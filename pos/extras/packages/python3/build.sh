# The plain gcc and g++ (the sdk's, pos-link's PATH): sysconfig records
# them for the C extensions built later, so not this sdk's path.
# zoneinfo reads pos' tzdata (not a requirement: it shares zdump and zic
# with glibc, so the two do not compose into one environment).
# EXTERNALLY-MANAGED (PEP 668) turns pip away from the installed tree:
# packages go into a venv or ~/.local, or become recipes.
pkg() {
  pkg_configure CC=gcc CXX=g++ \
    --enable-shared \
    --with-system-expat \
    --with-ensurepip=install \
    --with-tzpath=/pos/share/zoneinfo
  pkg_compile
  pkg_install
  local lib=("${dest_dir}${prefix}"/lib/python3.*/os.py)
  cat > "${lib%/os.py}/EXTERNALLY-MANAGED" <<'EOT'
[externally-managed]
Error=The pos-extras Python is read-only. Use a venv (python3 -m venv), pip install --user, or add a pos-extras recipe.
EOT
}
