# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A collection of modules for Guile allowing access to the PostgreSQL RDBMS"
HOMEPAGE="http://www.nongnu.org/guile-pg/"
SRC_URI="http://download.savannah.nongnu.org/releases/guile-pg/${P}.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-db/postgresql
	dev-scheme/guile
"
RDEPEND="${DEPEND}"
BDEPEND=""
