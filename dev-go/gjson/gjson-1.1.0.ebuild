# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/gjson"

DESCRIPTION="Get JSON values very quickly in Go"
HOMEPAGE="https://github.com/tidwall/gjson"
SRC_URI="https://github.com/tidwall/gjson/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/match
"
RDEPEND="${DEPEND}"
