# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tidwall/evio"
EGIT_COMMIT="484881f2cbbf9e63bc2a645a4789b1de420a6317"

DESCRIPTION="Fast event-loop networking for Go"
HOMEPAGE="https://github.com/tidwall/evio"
SRC_URI="https://github.com/tidwall/evio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
