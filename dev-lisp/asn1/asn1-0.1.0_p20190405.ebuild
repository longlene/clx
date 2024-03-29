# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c66b4c28cfb1212d70c27423c102906882a9090c"

DESCRIPTION="ASN.1 encoder/decoder"
HOMEPAGE="https://github.com/fukamachi/asn1"
SRC_URI="https://github.com/fukamachi/asn1/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
	dev-lisp/ironclad
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "asn1\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
