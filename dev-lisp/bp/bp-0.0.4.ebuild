# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Bitcoin Protocol components in Common Lisp"
HOMEPAGE="https://github.com/rodentrabies/bp"
SRC_URI="https://github.com/rodentrabies/bp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/ironclad
	dev-lisp/usocket
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "bp\/tests",$d' \
		-i bp.asd
	rm -rf tests
}
