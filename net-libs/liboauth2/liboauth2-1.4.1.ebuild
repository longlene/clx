# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="OAuth 2.0 and OpenID Connect C library"
HOMEPAGE="https://github.com/zmartzone/liboauth2"
SRC_URI="https://github.com/zmartzone/liboauth2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/cjose
	dev-libs/jansson
	dev-libs/openssl
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
