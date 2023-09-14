# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/anaskhan96/soup"

DESCRIPTION="Web Scraper in Go, similar to BeautifulSoup"
HOMEPAGE="https://github.com/anaskhan96/soup"
SRC_URI="https://github.com/anaskhan96/soup/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
