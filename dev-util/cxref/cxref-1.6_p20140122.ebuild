# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV=1.6e

DESCRIPTION="C Cross Referencing & Documenting tool"
HOMEPAGE="http://www.gedanken.demon.co.uk/cxref/"
SRC_URI="https://www.gedanken.org.uk/software/cxref/download/cxref-${MY_PV}.tgz -> ${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"/${PN}-${MY_PV}

