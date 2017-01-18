# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="A sinatra inspired modern c++ web framework"
HOMEPAGE="https://github.com/topcpporg/cinatra"
SRC_URI="https://github.com/topcpporg/cinatra/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[context,threads]
"
RDEPEND="${DEPEND}"
