# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A CoAP implementation in C"
HOMEPAGE="https://github.com/obgm/libcoap"
SRC_URI="https://github.com/obgm/libcoap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 BSD )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

