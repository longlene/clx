# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c336308f37f8ceb26f719ab84f64f8b399e2546b"

DESCRIPTION="Document classification"
HOMEPAGE="https://github.com/masatoi/cl-docclass"
SRC_URI="https://github.com/masatoi/cl-docclass/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-igo
	dev-lisp/cl-online-learning
	dev-lisp/alexandria
	dev-lisp/wiz-util
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
