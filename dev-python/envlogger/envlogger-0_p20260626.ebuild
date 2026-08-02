# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A tool for recording RL trajectories"
HOMEPAGE="https://github.com/google-deepmind/envlogger"

MY_COMMIT="907c8ebccd5a5a4a596911e86862bddce6c746e8"
SRC_URI="https://github.com/google-deepmind/envlogger/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/envlogger-${MY_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-libs/protobuf
"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/dm-env[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"

src_prepare() {
	# Generate protobuf Python bindings (proto has no gRPC services; plain protoc suffices)
	protoc --proto_path=. --python_out=. envlogger/proto/storage.proto || die

	# Drop Bazel-built C++ extensions, custom build hooks, and setup_requires
	perl -i -0pe 's/\n    ext_modules=\[.*?\n    \],//s' setup.py || die
	perl -i -0pe 's/\n    cmdclass=\{.*?\n    \},//s' setup.py || die
	perl -i -0pe 's/\n    setup_requires=\[.*?\n    \],//s' setup.py || die

	distutils-r1_src_prepare
}
