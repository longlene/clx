# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="1037296f604c3210ce073a53539d4ae95b0c2f8c"

DESCRIPTION="A linter for Common Lisp source code using SBCL"
HOMEPAGE="https://github.com/cxxxr/sblint"
SRC_URI="https://github.com/cxxxr/sblint/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}
