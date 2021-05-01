# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a7af2ef1aab1f7d01de40c27a69c3bf495e6e9c3"

DESCRIPTION="A portable Common Lisp library for running external programs"
HOMEPAGE="https://github.com/sellout/external-program"
SRC_URI="https://github.com/sellout/external-program/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem external-program-test/,$d' ${PN}.asd
		rm -r tests
	fi
}
