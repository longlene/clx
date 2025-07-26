# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Simple and powerful HTML generation library"
HOMEPAGE="https://github.com/skyizwhite/hsx"
SRC_URI="https://github.com/skyizwhite/hsx/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
