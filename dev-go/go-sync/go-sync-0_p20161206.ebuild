# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="golang.org/x/sync/..."
EGIT_COMMIT="450f422ab23cf9881c94e2db30cac0eb1b7cf80c"

DESCRIPTION="concurrency primitives"
HOMEPAGE="https://github.com/golang/sync"
SRC_URI="https://github.com/golang/sync/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
