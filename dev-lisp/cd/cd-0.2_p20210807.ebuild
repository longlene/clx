# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="32fe0e0a98f5cbe2de2a92fa107d03a7be681497"

DESCRIPTION="CFFI bindings to CD, a 2D Graphics Library"
HOMEPAGE="https://github.com/lispnik/cd"
SRC_URI="https://github.com/lispnik/cd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/cd
	dev-lisp/cffi
	dev-lisp/tecgraf-base
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/im
"
BDEPEND=""

src_prepare() {
	default
	rm -r ${PN}-examples.asd examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}
