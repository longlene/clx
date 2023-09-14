# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Single Sign On server"
HOMEPAGE="https://github.com/babelouest/glewlwyd"
SRC_URI="https://github.com/babelouest/glewlwyd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/hoel
	dev-libs/jansson
	dev-libs/libconfig
	dev-libs/libjwt
	dev-libs/yder
	dev-libs/ulfius
	dev-libs/orcania
	net-libs/libmicrohttpd
	net-misc/curl
	dev-db/sqlite
	sys-auth/oath-toolkit
"
RDEPEND="${DEPEND}"
BDEPEND=""
