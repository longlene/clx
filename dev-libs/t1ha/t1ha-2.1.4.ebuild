# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast Positive Hash"
HOMEPAGE="https://abf.io/erthink/t1ha"
SRC_URI="https://abf.io/erthink/t1ha/archive/${PN}-v${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-v${PV}

src_install() {
	insinto /usr/include
	doins t1ha.h
	dolib.a libt1ha.a
	einstalldocs
}
