# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Oracle database driver for cl-dbi"
HOMEPAGE="https://github.com/sergadin/dbd-oracle"
SRC_URI="https://github.com/sergadin/dbd-oracle/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/oracle-instantclient
	dev-lisp/cffi
	dev-lisp/cl-dbi
	test? ( dev-lisp/lift )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
