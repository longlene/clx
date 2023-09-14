# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e1379ff0df9c9d415a0ca2e8c9d6116865904e9e"

DESCRIPTION="Utility for line oriented string data"
HOMEPAGE="https://github.com/hyotang666/with-fields"
SRC_URI="https://github.com/hyotang666/with-fields/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
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
