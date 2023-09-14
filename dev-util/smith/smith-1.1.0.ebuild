# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Smith: A microcontainer builder"
HOMEPAGE="https://github.com/oracle/smith"
SRC_URI="https://github.com/oracle/smith/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"
