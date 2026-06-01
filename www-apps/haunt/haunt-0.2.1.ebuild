# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Haunt is a simple, functional, hackable static site generator written in"
HOMEPAGE="https://haunt.dthompson.us/"
SRC_URI="http://files.dthompson.us/haunt/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-scheme/guile
"
RDEPEND="${DEPEND}"
