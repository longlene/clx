# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0745eb5a7a1917fad8d12fde37981fcf33439198"

DESCRIPTION="An ActivityPub implementation in Common Lisp"
HOMEPAGE="https://github.com/jfmcbrayer/cl-activitypub"
SRC_URI="https://github.com/jfmcbrayer/cl-activitypub/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/yason
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "cl-activitypub-test/,$d' ${PN}.asd
		rm -rf tests
	fi
}
