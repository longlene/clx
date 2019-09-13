# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8bafee3bed7fc5a0fb318b013109a0a106131c99"

DESCRIPTION="Import Python modules as Vernacular modules"
HOMEPAGE="https://github.com/ruricolist/bosom-serpent"
SRC_URI="https://github.com/ruricolist/bosom-serpent/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/burgled-batteries
	dev-lisp/vernacular
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
	dev-lisp/trivia
"
BDEPEND=""
