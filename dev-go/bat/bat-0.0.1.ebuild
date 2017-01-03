# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/astaxie/bat"

DESCRIPTION="cURL-like tool for humans"
HOMEPAGE="https://github.com/astaxie/bat"
SRC_URI="https://github.com/astaxie/bat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bat
	dodoc src/${EGO_PN}/README.md
}
