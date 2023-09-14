# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8b11b0b48cbb655721e423bb6fa48bb7bb8760aa"

DESCRIPTION="TOML v0.4.0 parser and encoder"
HOMEPAGE="https://github.com/cxxxr/cl-toml/"
SRC_URI="https://github.com/cxxxr/cl-toml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-types
	dev-lisp/esrap
	dev-lisp/local-time
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-test.asd test.lisp
}
	
