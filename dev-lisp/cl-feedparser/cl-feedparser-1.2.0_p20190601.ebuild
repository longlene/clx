# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="031d9f4ed580156bc85e52cf462f1a0355c5680e"

DESCRIPTION="Common Lisp feed parser"
HOMEPAGE="https://github.com/ruricolist/cl-feedparser"
SRC_URI="https://github.com/ruricolist/cl-feedparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	dev-lisp/fxml
	dev-lisp/cl-html5-parser
	dev-lisp/net-telent-date
"
