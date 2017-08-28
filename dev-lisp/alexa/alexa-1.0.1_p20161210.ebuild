# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66cb5cba3b88d023665bc28abf3ef1ea9dda50b0"

DESCRIPTION="A Lexical Analyzer Generator"
HOMEPAGE="https://github.com/rigetticomputing/alexa/"
SRC_URI="https://github.com/rigetticomputing/alexa/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
"
