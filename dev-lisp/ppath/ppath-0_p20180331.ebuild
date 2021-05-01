# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9f70bee9a041977fb34e6f5fa36ee63999083042"

DESCRIPTION="Common Lisp's implementation of the Python's os.path module"
HOMEPAGE="https://github.com/fourier/ppath"
SRC_URI="https://github.com/fourier/ppath/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/osicat
	dev-lisp/uiop
	dev-lisp/trivial-features
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
