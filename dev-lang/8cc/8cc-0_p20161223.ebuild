# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="b8a46abdb5f0633bdbff314820daf560cb987377"

DESCRIPTION="A Small C Compiler"
HOMEPAGE="https://github.com/rui314/8cc"
SRC_URI="https://github.com/rui314/8cc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin 8cc
	dodoc README.md
}
