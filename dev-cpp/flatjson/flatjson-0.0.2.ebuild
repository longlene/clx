# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The extremely fast zero allocation and zero copying JSON parser"
HOMEPAGE="https://github.com/niXman/flatjson"
SRC_URI="https://github.com/niXman/flatjson/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/flatjson
	einstalldocs
}
