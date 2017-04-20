# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1d3bf60fe3090b8865eb0224b88cd02c082739aa"

DESCRIPTION="A Flexible Scraping and Web Crawling Toolbox in Common Lisp"
HOMEPAGE="https://github.com/VitoVan/cl-httparser"
SRC_URI="https://github.com/VitoVan/cl-httparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/plump
	dev-lisp/clss
	dev-lisp/iconv
	dev-lisp/babel
"
