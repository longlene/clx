# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Functional reactive game programming in GNU Guile Scheme"
HOMEPAGE="https://github.com/taktoa/guile-sly"
SRC_URI=""

EGIT_REPO_URI="https://github.com/taktoa/guile-sly.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-scheme/guile-sdl
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
