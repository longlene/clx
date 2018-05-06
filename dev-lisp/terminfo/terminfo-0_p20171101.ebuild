# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c07f107e8d87028f0767a3fe65a5838afdcd052e"

DESCRIPTION="A terminfo database front end in Common Lisp"
HOMEPAGE="https://github.com/npatrick04/terminfo/"
SRC_URI="https://github.com/npatrick04/terminfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/ncurses
"
