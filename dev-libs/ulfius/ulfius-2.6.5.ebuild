# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Web Framework to build REST APIs, Webservices or any HTTP endpoint in C language"
HOMEPAGE="https://github.com/babelouest/ulfius"
SRC_URI="https://github.com/babelouest/ulfius/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/orcania
	dev-libs/yder
	net-libs/libmicrohttpd
	net-libs/gnutls
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""
