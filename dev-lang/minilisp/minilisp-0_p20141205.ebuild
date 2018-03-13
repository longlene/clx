# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="71d591419cbd62336e2a4506d03608ed1d4c9a95"

DESCRIPTION="A mini lisp implementation"
HOMEPAGE="https://github.com/rui314/minilisp"
SRC_URI="https://github.com/rui314/minilisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin minilisp
	dodoc README.md
}
