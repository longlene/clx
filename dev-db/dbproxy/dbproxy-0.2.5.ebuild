# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="DBProxy"
HOMEPAGE="https://github.com/Meituan-Dianping/DBProxy"
SRC_URI="https://github.com/Meituan-Dianping/DBProxy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/mysql
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/DBProxy-${PV}
