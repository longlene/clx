# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Lossless audio decoder written in Common Lisp"
HOMEPAGE="https://github.com/shamazmazum/easy-audio"
SRC_URI="https://github.com/shamazmazum/easy-audio/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/serapeum
	dev-lisp/alexandria
	dev-lisp/flexi-streams
	dev-lisp/nibbles-streams
	dev-lisp/stateless-iterators
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :easy-audio\/examples/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
