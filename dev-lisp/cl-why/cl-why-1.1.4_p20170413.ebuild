# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="decd71498d08c386d1d3b6794d965837fb1fd5dd"

DESCRIPTION="(X)HTML generation macros"
HOMEPAGE="https://github.com/jpcima/cl-why/"
SRC_URI="https://github.com/jpcima/cl-why/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/flexi-streams )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r test
		sed -i '/defsystem\ :cl-why-test/,$d' cl-why.asd
	fi
}
		
