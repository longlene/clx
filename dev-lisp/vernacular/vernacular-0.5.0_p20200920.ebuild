# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="79be179e9ada423b3ec41d2a1ea6f6e0266ed21f"

DESCRIPTION="Module system for languages embedded in Common Lisp"
HOMEPAGE="https://github.com/ruricolist/vernacular"
SRC_URI="https://github.com/ruricolist/vernacular/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/overlord
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/trivia
	dev-lisp/local-time
	dev-lisp/trivial-garbage
"
BDEPEND=""
