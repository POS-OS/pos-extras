# Building
pos-extras builds the packages that are not part of the OS: applications,
and the tools builds use (make, autotools, perl, python, git, diffutils,
patch and others), from their upstream release archives. It is built by
the engine of POS, `buildsys/` of a pos checkout; pos's BUILD.md
describes the engine (builds, references, package meta, release
archives, the toolchain).

    $ echo "engine-checkout /path/to/pos" >>~/.config/pos/pos-extras.conf
    $ ./build plan --new                # what an extras build builds
    $ ./build run --new                 # build the extras

The engine does not build an extras pipeline yet: there are no package
recipes here until it does.

## Engine
`./build` runs the engine at the pos commit the `engine` line of
`project` pins. The engine is a clone of the pos checkout the
`engine-checkout` setting names (`POS_ENGINE_CHECKOUT`; in
`~/.config/pos/pos-extras.conf`, or in `build.conf` beside it), in
`work/engine`, sparse (`buildsys/`) and checked out at that commit; a
new pin is fetched from the checkout. The clone shares the checkout's
objects (`git clone --shared`): a pinned commit must stay in the
checkout, as commits of its main do. `POS_ENGINE` names a pos checkout
to run as it is instead, for work on the engine. Moving to a newer
engine is a commit of the `engine` line. A build records the engine's
commit in its `info`.

The settings are pos's (`build.conf.dist` of the engine):
`pos-extras.conf` holds what differs from pos's, as `release-dir`.

## Trees
* `pos/build-env`: the host and profile packages, a copy of pos's: the
  Fedora compiler (`gcc-host`), the host tools, and `pos-link`.

## Releases
The output `app` makes the extras an app archive,
`pos-extras-app-<stem>.tar.zst` and its manifest
`pos-extras-app-<stem>.app` (the engine's BUILD.md "App archives"),
published with the build's reference archive: the tree of
`/apps/pos-extras/<version>-<release>`. On a machine, `pos-app install`
installs it and puts its `bin` on `PATH`. It requires the pos release line
of its pos reference (`os`, the product version) and the gcc-runtime of
its toolchain reference's gcc or a newer one.

## Project tiers
pos-extras depends on pos at runtime, never on pos-sdk; pos-sdk does not
depend on pos-extras either. A build of any of the three projects runs on
pos, pos-sdk and pos-extras together, each a pinned release. Fedora's
packages (`host-base`) are the build tools only of the first build of
pos-extras; later builds use the previous pos-extras release.
