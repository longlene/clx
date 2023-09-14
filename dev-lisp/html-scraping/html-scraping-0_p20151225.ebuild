# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d83ffe0e953e9b27e42813a2ab2311728a9b3540"

DESCRIPTION="html-scraping"
HOMEPAGE="https://github.com/stassats/html-scraping"
SRC_URI="https://github.com/stassats/html-scraping/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cxml-stp
	dev-lisp/closure-html
"
