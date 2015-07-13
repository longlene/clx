# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A terminfo database front end in Common Lisp"
HOMEPAGE="https://github.com/npatrick04/terminfo/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/npatrick04/terminfo.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/ncurses
"
