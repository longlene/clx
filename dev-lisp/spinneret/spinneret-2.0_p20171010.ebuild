# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec29a7729078391533e2038914cdbe482468b5c5"

DESCRIPTION="Common Lisp HTML5 generator"
HOMEPAGE="https://github.com/ruricolist/spinneret"
SRC_URI="https://github.com/ruricolist/spinneret/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-markdown
	dev-lisp/parenscript
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/global-vars
	dev-lisp/serapeum
	dev-lisp/trivial-gray-streams
"
