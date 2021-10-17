# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/ManiacMike/gorobot"
EGIT_COMMIT="982b2c4fb6f3d6fb2af6a7d3ab2a50355f4a7b4e"

DESCRIPTION="golang wechat bot"
HOMEPAGE="https://github.com/ManiacMike/gorobot"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/config
"
# github.com/larspensjo/config
RDEPEND="${DEPEND}"

src_install() {
	dobin gorobot
	dodoc src/${EGO_PN}/README.md
}
