# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/fiorix/wsdl2go"

DESCRIPTION="Command line tool to generate Go code from WSDL"
HOMEPAGE="https://github.com/fiorix/wsdl2go"
SRC_URI="https://github.com/fiorix/wsdl2go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/wsdl2go
	dodoc src/${EGO_PN}/README.md
}
