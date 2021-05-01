# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7a037bdfc1eaecea5c077eaa1d18e22fbf3574e2"

DESCRIPTION="mgl-user project"
HOMEPAGE="https://github.com/masatoi/mgl-user"
SRC_URI="https://github.com/masatoi/mgl-user/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mgl[example]
	dev-lisp/fare-csv
	dev-lisp/parse-number
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
