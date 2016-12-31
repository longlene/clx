# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/nuveo/prest"
EGIT_COMMIT="6e51426bac05042232f955658dfc1ae7f5b8647a"

DESCRIPTION="Serve a RESTful API from any PostgreSQL database"
HOMEPAGE="http://postgres.rest"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/prest
	dodoc src/${EGO_PN}/README.md
}
