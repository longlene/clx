# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3cef4dc09b39859223684700edafbb5ddcc84445"

DESCRIPTION="Common Lisp utility library for using external package locally"
HOMEPAGE="https://github.com/hyotang666/with-package"
SRC_URI="https://github.com/hyotang666/with-package/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trestrul
	dev-lisp/named-readtables
	test? ( dev-lisp/jingoh )
"

src_prepare() {
	eapply_user
	use test || rm -r spec
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
