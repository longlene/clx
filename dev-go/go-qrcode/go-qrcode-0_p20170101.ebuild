# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/skip2/go-qrcode/..."
EGIT_COMMIT="cf02323edc040f5263d08b45a60bc8abdc3bde18"

DESCRIPTION="QR Code encoder"
HOMEPAGE="https://github.com/skip2/go-qrcode"
SRC_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/qrcode
	dodoc src/${EGO_PN%/*}/README.md
}
