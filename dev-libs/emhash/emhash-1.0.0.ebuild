# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast and memory efficient open addressing C++ flat hash table/map"
HOMEPAGE="https://github.com/ktprime/emhash"
SRC_URI="https://github.com/ktprime/emhash/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/emhash
	doins hash_*.hpp
	einstalldocs
}
