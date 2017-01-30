# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/lionkov/go9p/..."
EGIT_COMMIT="9fba78810500b1458eb390171fb5d9427d503a59"

DESCRIPTION="9P and 9P2000 distributed resource protocols in Go"
HOMEPAGE="https://github.com/lionkov/go9p"
SRC_URI="https://github.com/lionkov/go9p/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
