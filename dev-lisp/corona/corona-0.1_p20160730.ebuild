# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6425ce5d3ae4da5df4a7ea9042fb86cc37b30125"

DESCRIPTION="Create and manage virtual machines from Common Lisp"
HOMEPAGE="http://eudoxia.me/corona"
SRC_URI="https://github.com/eudoxia0/corona/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-virtualbox
	dev-lisp/trivial-download
	dev-lisp/trivial-types
	dev-lisp/trivial-extract
	dev-lisp/ironclad
	dev-lisp/cl-fad
	dev-lisp/log4cl
	dev-lisp/anaphora
	dev-lisp/cl-markup
	dev-lisp/lass
	dev-lisp/3bmd
	test? ( dev-lisp/clack dev-lisp/fiveam dev-lisp/archive )
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
