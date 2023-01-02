# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A line oriented front end for ii-like chat programs"
HOMEPAGE="https://tools.suckless.org/lchat/"
SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libgrapheme"
RDEPEND="${DEPEND}
	sys-apps/grep
"
BDEPEND=""

src_install() {
	dobin lchat
	doman lchat.1
	einstalldocs
}
