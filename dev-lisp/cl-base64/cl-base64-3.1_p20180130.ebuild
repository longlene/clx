# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="80496b74293e956364b2d3dbdfc87d74bfeeeda4"

DESCRIPTION="Common Lisp base64 library"
HOMEPAGE="https://github.com/darabi/cl-base64"
SRC_URI="https://github.com/darabi/cl-base64/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	if use !test ; then
		rm ${PN}-tests.asd tests.lisp
	fi
}
