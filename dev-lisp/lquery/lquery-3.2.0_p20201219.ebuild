# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3e3a3c6b36183b63a3f473cb1fb30da9f775a078"

DESCRIPTION="A Common Lisp library to allow jQuery-like HTML/DOM manipulation"
HOMEPAGE="https://shinmera.github.io/lquery"
SRC_URI="https://github.com/Shinmera/lquery/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/array-utils
	dev-lisp/form-fiddle
	dev-lisp/plump
	dev-lisp/clss
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd ${PN}-test.lisp
}
