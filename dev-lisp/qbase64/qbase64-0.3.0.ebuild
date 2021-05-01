# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Fast and flexible base64 encoder/decoder in Lisp"
HOMEPAGE="https://github.com/chaitanyagupta/qbase64/"
SRC_URI="https://github.com/chaitanyagupta/qbase64/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	dev-lisp/metabang-bind
	test? ( dev-lisp/fiveam dev-lisp/temporary-file )
"

src_prepare() {
	default
	rm -r benchmark
	if ! use test ; then
		sed -i '/defsystem "qbase64/test/,$d' ${PN}.asd
		rm qbase64-test.lisp
	fi
}
