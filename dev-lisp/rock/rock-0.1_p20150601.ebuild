# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3223ac31dd3f783ffd978b45d3b8bcc38bf37abc"

DESCRIPTION=""
HOMEPAGE="https://github.com/eudoxia0/rock"
SRC_URI="https://github.com/eudoxia0/rock/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-download
	dev-lisp/trivial-extract
	dev-lisp/trivial-types
	dev-lisp/anaphora
	dev-lisp/cl-markup
	dev-lisp/lass
	dev-lisp/3bmd
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md assets
}
