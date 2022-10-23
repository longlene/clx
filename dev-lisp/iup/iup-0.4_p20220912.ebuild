# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b9b23029b7e57a2be36c9c92ca294d0c463c7679"

DESCRIPTION="Common Lisp CFFI bindings to the IUP Portable User Interface library"
HOMEPAGE="https://github.com/lispnik/iup"
SRC_URI="https://github.com/lispnik/iup/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-libs/iup
	dev-lisp/cffi
	dev-lisp/cd
	dev-lisp/im
	dev-lisp/tecgraf-base
	dev-lisp/serapeum
	dev-lisp/trivial-features
	dev-lisp/alexandria
	dev-lisp/genhash
	dev-lisp/trivial-arguments
	dev-lisp/split-sequence
	dev-lisp/parse-number
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}
