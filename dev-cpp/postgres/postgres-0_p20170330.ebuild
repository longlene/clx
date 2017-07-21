# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="c430cc45fd4611093e6119caa5807810e8176231"

DESCRIPTION="C++11 client library for PostgreSQL"
HOMEPAGE="https://github.com/taocpp/postgres"
SRC_URI="https://github.com/taocpp/postgres/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake lib
}

src_install() {
	dolib.a build/lib/libtaopq.a
	insinto /usr
	doins -r include
	dodoc README.md
}
