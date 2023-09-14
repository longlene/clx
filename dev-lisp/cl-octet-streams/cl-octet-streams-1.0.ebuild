# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="In-memory octet streams"
HOMEPAGE="https://github.com/glv2/cl-octet-streams"
SRC_URI="https://github.com/glv2/cl-octet-streams/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/(defsystem "cl-octet-streams/tests"/,$d' ${PN}.asd
		rm -r tests
	fi
}
