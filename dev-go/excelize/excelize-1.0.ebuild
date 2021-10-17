# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/Luxurioust/excelize"

DESCRIPTION="Golang library for reading and writing Microsoft Excel"
HOMEPAGE="https://github.com/Luxurioust/excelize"
SRC_URI="https://github.com/360EntSecGroup-Skylar/excelize/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
