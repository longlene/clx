# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Json pretty-print parser based on a recursive lexical analyser"
HOMEPAGE="https://github.com/pantuza/jsoncat"
SRC_URI="https://github.com/pantuza/jsoncat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/jsoncat
	dodoc README.md
}
