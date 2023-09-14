# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp library for Java class file manipulation"
HOMEPAGE="https://github.com/davidsun0/jclass"
SRC_URI="https://github.com/davidsun0/jclass/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/float-features
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "jclass\/tests",$d' \
		-i ${PN}.asd
	rm -rf tests
}
