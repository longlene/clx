# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A file format that achieves a new frontier of IO efficiency"
HOMEPAGE="https://github.com/google/array_record"
SRC_URI="https://github.com/google/array_record/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/array_record-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/etils[epath,${PYTHON_USEDEP}]
"
BDEPEND="
	dev-build/bazel
"

src_compile() {
	bazel build //python:array_record_module || die
	cp "$(bazel info bazel-bin)/python/array_record_module.so" python/ || die
	distutils-r1_src_compile
}
