# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/longlene/ts"

DESCRIPTION="Tiny Translator in Console"
HOMEPAGE="https://github.com/longlene/ts"
SRC_URI="https://github.com/longlene/ts/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ts
	dodoc "${S}/src/${EGO_PN}"/README.md
}
