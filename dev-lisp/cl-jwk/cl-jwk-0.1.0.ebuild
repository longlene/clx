# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp system for decoding public JSON Web Keys"
HOMEPAGE="https://github.com/dnaeon/cl-jwk"
SRC_URI="https://github.com/dnaeon/cl-jwk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/binascii
	dev-lisp/cl-reexport
	dev-lisp/dexador
	dev-lisp/ironclad
	dev-lisp/jonathan
	dev-lisp/jose
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}.test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
