# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A modular query optimizer for big data"
HOMEPAGE="https://github.com/greenplum-db/gporca"
SRC_URI="https://github.com/greenplum-db/gporca/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/gp-xerces
"
RDEPEND="${DEPEND}"
