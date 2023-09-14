# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="50646251908e5cdfeb7d071980c4ec922e8e8ff4"

DESCRIPTION="A super simple regression test package"
HOMEPAGE="https://github.com/clementfarabet/regress"
SRC_URI="https://github.com/clementfarabet/regress/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-misc/trepl
"

src_install() {
	insinto $(lua_get_sharedir)/regress
	doins init.lua
	dodoc README.md
}
