# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

EGIT_COMMIT="874087281b0a2fb5c97a45621fe30fe70855e7e5"

DESCRIPTION="Common Lisp feed parser"
HOMEPAGE="https://github.com/TBRSS/cl-feedparser"
SRC_URI="https://github.com/TBRSS/cl-feedparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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