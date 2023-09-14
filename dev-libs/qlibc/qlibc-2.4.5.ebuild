# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="qLibc is a simple and powerful C library"
HOMEPAGE="http://wolkykim.github.io/qlibc"
SRC_URI="https://github.com/wolkykim/qlibc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix="${D}"/usr
}

src_install() {
	emake -j1 install
}
