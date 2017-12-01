# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="b05c529db9192202e2f70b66be865dead093d48e"

DESCRIPTION="AntDB is a distributed database to provide both write-scalability and massively parallel processing"
HOMEPAGE="https://github.com/ADBSQL/AntDB"
SRC_URI="https://github.com/ADBSQL/AntDB/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
