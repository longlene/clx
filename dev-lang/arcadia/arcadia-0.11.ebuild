# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="An implementation of the Arc programming language"
HOMEPAGE="https://github.com/kimtg/arcadia"
SRC_URI="https://github.com/kimtg/arcadia/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin "${BUILD_DIR}"/arcadia
	dodoc README.md
}
