# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a523accba10867814c6baf9c24636064a0c6a763"

DESCRIPTION="Hacker News in Common Lisp"
HOMEPAGE="https://github.com/malisper/HNCL"
SRC_URI="https://github.com/malisper/HNCL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clamp
"
