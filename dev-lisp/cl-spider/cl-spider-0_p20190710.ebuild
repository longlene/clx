# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5226ef7ed479cac45bc9ba84d24bf41641d4211a"

DESCRIPTION="A Common Lisp Spider for the Web"
HOMEPAGE="https://github.com/VitoVan/cl-spider"
SRC_URI="https://github.com/VitoVan/cl-spider/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/plump
	dev-lisp/clss
"
