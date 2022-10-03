# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ compile-time enum to string, iteration, in a single header file"
HOMEPAGE="https://github.com/aantron/better-enums"
SRC_URI="https://github.com/aantron/better-enums/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins enum.h
	einstalldocs
}
