# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 )
inherit distutils-r1

DESCRIPTION="An asyncio based Python 3 client for NATS"
HOMEPAGE="https://github.com/nats-io/asyncio-nats"
SRC_URI="https://github.com/nats-io/asyncio-nats/archive/v0.6.4.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
