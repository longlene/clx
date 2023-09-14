# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="73f7ef3e13a6c9980b44b767cb985ed8afa5543e"

DESCRIPTION=""
HOMEPAGE="https://github.com/momozor/blue-beanie"
SRC_URI="https://github.com/momozor/blue-beanie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
	dev-lisp/cl-who
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "spacebean\/tests,$d' spacebean.asd
		rm -r tests
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all assets js full-spacebean.js index.html
}
