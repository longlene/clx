# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="A wrapper around the Nim compiler to allow for easy scripting of Nim"
HOMEPAGE="https://github.com/flaviut/nimrun"
SRC_URI=""

EGIT_REPO_URI="https://github.com/flaviut/nimrun.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/nim
"
src_install() {
	dobin nimrun
	dodoc README.md
}
