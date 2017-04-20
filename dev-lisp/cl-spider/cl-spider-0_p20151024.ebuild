# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a64f0c377757ca5d9ac5d9e8c5683653a75b8516"

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
