# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C and C++ database for objects and structs"
HOMEPAGE="https://github.com/objectbox/objectbox-c"
SRC_URI="https://github.com/objectbox/objectbox-c/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr
	doins -r include
	einstalldocs
}
