# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="af13f60dded3a73f7c15e3afa7741cbb4da94aeb"

DESCRIPTION="LISP Mathematical Library"
HOMEPAGE="https://github.com/richmit/mjrcalc"
SRC_URI="https://github.com/richmit/mjrcalc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-visualization/gnuplot
"
