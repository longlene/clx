# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/jmoiron/dmc"
EGIT_COMMIT="cba749c5c98ac07332eb0a31fa9025f477cf31d4"

DESCRIPTION="dmc runs commands via ssh on multiple machines"
HOMEPAGE="https://github.com/jmoiron/dmc"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-crypto
"
RDEPEND="${DEPEND}"

src_install() {
	dobin dmc
	dodoc src/${EGO_PN}/README.md
}
