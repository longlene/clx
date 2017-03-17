# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

MY_PV=${PV/_/-}

DESCRIPTION="Greenplum patched xerces-c"
HOMEPAGE="https://github.com/greenplum-db/gp-xerces"
SRC_URI="https://github.com/greenplum-db/gp-xerces/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	!dev-libs/xerces-c
"
RDEPEND="${DEPEND}"
