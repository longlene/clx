# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="'tail -f' your PostgreSQL tables"
HOMEPAGE="https://github.com/aaparmeggiani/pg_tail"
SRC_URI=""

EGIT_REPO_URI="https://github.com/aaparmeggiani/pg_tail.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_install() {
	dobin pg_tail
	dodoc README.md
}
