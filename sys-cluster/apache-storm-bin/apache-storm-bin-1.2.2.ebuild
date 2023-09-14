# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="apache-storm"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="distributed realtime computation system"
HOMEPAGE="http://storm.apache.org/"
SRC_URI="mirror://apache/storm/${MY_P}/${MY_P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
