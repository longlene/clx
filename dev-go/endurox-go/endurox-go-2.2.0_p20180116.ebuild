# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/endurox-dev/endurox-go"
EGIT_COMMIT="2874c929195790ae9635e97de759ad13b461c02f"

DESCRIPTION="Application Server for Go"
HOMEPAGE="https://github.com/endurox-dev/endurox-go"
SRC_URI="https://github.com/endurox-dev/endurox-go/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sys-cluster/endurox
"
RDEPEND="${DEPEND}"
