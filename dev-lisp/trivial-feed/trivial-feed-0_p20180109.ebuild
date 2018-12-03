# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80a6c361b9966a69d4a4dde66e2d9321425901f0"

DESCRIPTION="Parse syndication feeds such as RSS and ATOM to a canoical form"
HOMEPAGE="https://github.com/eugeneia/trivial-feed"
SRC_URI="https://github.com/eugeneia/trivial-feed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/xmls
	dev-lisp/cl-date-time-parser
	dev-lisp/flexi-streams
	dev-lisp/cl-ppcre
"
BDEPEND=""
