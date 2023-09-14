# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/k0kubun/pp"

DESCRIPTION="Colored pretty printer for Go language"
HOMEPAGE="https://github.com/k0kubun/pp"
SRC_URI="https://github.com/k0kubun/pp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-colorable
"
RDEPEND="${DEPEND}"
