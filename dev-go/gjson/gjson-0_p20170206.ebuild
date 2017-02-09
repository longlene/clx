# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/gjson"
EGIT_COMMIT="09d1c5c5bc64e094394dfe2150220d906c55ac37"

DESCRIPTION="Get JSON values very quickly in Go"
HOMEPAGE="https://github.com/tidwall/gjson"
SRC_URI="https://github.com/tidwall/gjson/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/match
"
RDEPEND="${DEPEND}"
