# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Automatic differentiation and probabilistic inference building blocks"
HOMEPAGE="https://github.com/masatoi/cl-acorn"
SRC_URI="https://github.com/masatoi/cl-acorn/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	:
}

src_install() {
	common-lisp-3_src_install
	einstalldocs
}
