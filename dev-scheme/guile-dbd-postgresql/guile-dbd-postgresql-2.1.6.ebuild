# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A driver for guile-dbi to use a postgresql database"
HOMEPAGE="http://home.gna.org/guile-dbi/"
SRC_URI="http://download.gna.org/guile-dbi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-scheme/guile-dbi
"
RDEPEND="${DEPEND}"
