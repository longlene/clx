# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="FastRPC library"
HOMEPAGE="https://github.com/seznam/fastrpc"
SRC_URI="https://github.com/seznam/fastrpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	libtoolize --force
	aclocal
	automake --force-missing --add-missing
	autoconf
}
