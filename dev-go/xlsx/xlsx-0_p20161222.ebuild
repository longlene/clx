# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tealeg/xlsx"
EGIT_COMMIT="e0f3d7d6cf84b282edb711bc6a23e8dbbd331a13"

DESCRIPTION="Google Go library for reading and writing XLSX files"
HOMEPAGE="https://github.com/tealeg/xlsx"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
