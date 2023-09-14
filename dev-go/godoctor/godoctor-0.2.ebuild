# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
EGO_PN="github.com/godoctor/godoctor"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Go Doctor - The Golang Refactoring Engine"
HOMEPAGE="http://gorefactor.org/"
SRC_URI="https://github.com/godoctor/godoctor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin /bin/godoctor
	dodoc README.md
}
