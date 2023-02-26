# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A C++ library for task sheduling"
HOMEPAGE="https://github.com/mafik/libcolony"
SRC_URI="https://github.com/mafik/libcolony/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins src/colony.h
	einstalldocs
}
