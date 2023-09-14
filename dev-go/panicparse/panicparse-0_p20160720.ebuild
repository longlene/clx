# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/maruel/panicparse/..."
EGIT_COMMIT="ad661195ed0e88491e0f14be6613304e3b1141d6"

DESCRIPTION="Crash your app in style"
HOMEPAGE="https://github.com/maruel/panicparse/"
SRC_URI="https://github.com/maruel/panicparse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/pp
}
