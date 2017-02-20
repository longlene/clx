# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="2f03722439d3a876f5fe756c7d379128ada60eeb"

DESCRIPTION="A micro Tcl implementation"
HOMEPAGE="https://github.com/zserge/partcl"
SRC_URI="https://github.com/zserge/partcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake tcl
}

src_install() {
	dobin tcl
	dodoc README.md
}
