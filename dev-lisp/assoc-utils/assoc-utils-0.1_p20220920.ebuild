# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="483a22ef42995f84fac00d11fb27ace671480153"

DESCRIPTION="Utilities for manipulating association lists"
HOMEPAGE="https://github.com/fukamachi/assoc-utils"
SRC_URI="https://github.com/fukamachi/assoc-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
