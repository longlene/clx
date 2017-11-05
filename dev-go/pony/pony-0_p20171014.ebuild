# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/pony"
EGIT_COMMIT="486ea2dd9b05acb2e75cebd810e86b5529957afc"

DESCRIPTION="Turn your terminal text into an absolutely beautiful display of dazzling colors"
HOMEPAGE="https://github.com/tidwall/pony"
SRC_URI="https://github.com/tidwall/pony/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
