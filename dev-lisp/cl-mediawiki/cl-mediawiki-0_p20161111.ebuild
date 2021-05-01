# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="154d20e81fb3c27ac00b53991471673e73b19160"

DESCRIPTION="A Common Lisp wrapper around the MediaWiki API"
HOMEPAGE="https://github.com/AccelerationNet/cl-mediawiki"
SRC_URI="https://github.com/AccelerationNet/cl-mediawiki/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	dev-lisp/drakma
	dev-lisp/alexandria
	test? ( dev-lisp/lisp-unit2 )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd tests
}
