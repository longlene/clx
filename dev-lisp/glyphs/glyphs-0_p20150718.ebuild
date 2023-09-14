# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7137ab106fde2560face8993c441be9d2c013773"

DESCRIPTION="Glyphs - Reducing Common Lisp verbosity"
HOMEPAGE="https://github.com/ahungry/glyphs"
SRC_URI="https://github.com/ahungry/glyphs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/parenscript
	dev-lisp/named-readtables
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd tests
}
