# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Dead Simple VPN"
HOMEPAGE="https://github.com/jedisct1/dsvpn"
SRC_URI="https://github.com/jedisct1/dsvpn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/strip/d' Makefile
}

src_install() {
	dosbin dsvpn
	dodoc README.md
}
