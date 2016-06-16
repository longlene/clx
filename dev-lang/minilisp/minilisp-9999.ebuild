# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="A mini lisp implementation"
HOMEPAGE="https://github.com/rui314/minilisp"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/rui314/minilisp.git"

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
