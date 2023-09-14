# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight, portable and easy to integrate C directory and file reader"
HOMEPAGE="https://github.com/cxong/tinydir"
SRC_URI="https://github.com/cxong/tinydir/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins tinydir.h
	dodoc README.md
}
