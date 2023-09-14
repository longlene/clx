# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="SafeInt is a class library for C++ that manages integer overflows"
HOMEPAGE="https://github.com/dcleblanc/SafeInt"
SRC_URI="https://github.com/dcleblanc/SafeInt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins SafeInt.hpp
	dodoc README.md
}
