# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Share your terminal over the web"
HOMEPAGE="https://github.com/tsl0922/ttyd"
SRC_URI="https://github.com/tsl0922/ttyd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
	net-libs/libwebsockets
	dev-libs/json-c
"
RDEPEND="${DEPEND}"
