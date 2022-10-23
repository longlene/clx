# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="General-purpose keymap management"
HOMEPAGE="https://github.com/atlas-engineer/nkeymaps"
SRC_URI="https://github.com/atlas-engineer/nkeymaps/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/fset
	dev-lisp/trivial-package-local-nicknames
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "nkeymaps\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
