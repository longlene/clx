# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="74422b5fefab00970238148bb5f7354a482e8396"

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
