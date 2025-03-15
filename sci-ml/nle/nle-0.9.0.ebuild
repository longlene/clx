# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="The NetHack Learning Environment"
HOMEPAGE="https://github.com/facebookresearch/nle"
SRC_URI="
	https://github.com/facebookresearch/nle/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/septag/deboost.context/archive/325fed7.tar.gz -> deboost.context-325fed7.tar.gz
	https://github.com/deadpixi/libtmt/archive/1da7ba9.tar.gz -> libtmt-1da7ba9.tar.gz
	https://github.com/pybind/pybind11/archive/8c0cd94.tar.gz -> pybind11-8c0cd94.tar.gz
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third_party/deboost.context && ln -sv "${WORKDIR}"/deboost.context-325fed7ee8b760e4cb79030a58dab74821fdcba9 third_party/deboost.context
	rmdir third_party/libtmt && ln -sv "${WORKDIR}"/libtmt-1da7ba96c459672142949a529e65d730cc5bd6a1 third_party/libtmt
	rmdir third_party/pybind11 && ln -sv "${WORKDIR}"/pybind11-8c0cd94465fbc1dbc34217e5a614edc784f0913e third_party/pybind11
}
