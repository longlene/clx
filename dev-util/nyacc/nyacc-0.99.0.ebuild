# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="nyacc parser generator"
HOMEPAGE="http://www.nongnu.org/nyacc/"
SRC_URI="mirror://nongnu/nyacc/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-scheme/guile
"
RDEPEND="${DEPEND}"
BDEPEND=""
