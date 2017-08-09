# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/petermattis/goid"
EGIT_COMMIT="0ded85884ba5c4c9267fcd5a149061f7c3455eee"

DESCRIPTION="Programatically retrieve the current goroutine's ID"
HOMEPAGE="https://github.com/petermattis/goid"
SRC_URI="https://github.com/petermattis/goid/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
