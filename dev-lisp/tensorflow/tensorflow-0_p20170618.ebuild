# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c982e79659681c8ae8bfbd759f41a0bf370daa8c"

DESCRIPTION="Common Lisp interface to tensorflow"
HOMEPAGE="https://gitlab.common-lisp.net/cungil/tensorflow"
SRC_URI="https://gitlab.common-lisp.net/cungil/tensorflow/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
	dev-lisp/cffi
	sci-libs/tensorflow
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem #:tensorflow/test/,$d' -i ${PN}.asd
		rm test.lisp
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all ffi proto
}
