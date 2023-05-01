# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ Minimalistic CSV Streams"
HOMEPAGE="https://github.com/shaovoon/minicsv"
SRC_URI="https://github.com/shaovoon/minicsv/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins MiniCSV/minicsv.h
	einstalldocs
}
