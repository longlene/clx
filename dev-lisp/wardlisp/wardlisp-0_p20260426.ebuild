# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="86b5e0b9abbe9a7b1f136a9dac0879ba83acc434"

inherit common-lisp-3

DESCRIPTION="Restricted Lisp evaluator for safe server-side evaluation in educational games"
HOMEPAGE="https://github.com/masatoi/wardlisp"
SRC_URI="https://github.com/masatoi/wardlisp/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${MY_COMMIT}"

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
