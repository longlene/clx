# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Dependency manager for the Crystal language"
HOMEPAGE="https://github.com/ysbaddaden/shards"
SRC_URI="https://github.com/ysbaddaden/shards/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-lang/crystal-0.10.0[yaml]
"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/shards
	dodoc README.md
}
