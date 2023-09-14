# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a1402c5c7db76a39cbac9a2ea6e463da2e5dcc5e"

DESCRIPTION="A Common Lisp client library for the IPFS API"
HOMEPAGE="https://github.com/wemeetagain/cl-ipfs-api"
SRC_URI="https://github.com/wemeetagain/cl-ipfs-api/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/dexador
	dev-lisp/fast-io
	dev-lisp/jonathan
	dev-lisp/multipart-stream
	dev-lisp/multipart-vfile-tree
	dev-lisp/path-string
	dev-lisp/quri
	dev-lisp/yason
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
