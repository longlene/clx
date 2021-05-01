# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e438ed30c5fdcde2bd28321d6a7fbaaa2f01f89b"

DESCRIPTION="An IRC bot for Common Lisp code evaluation"
HOMEPAGE="https://github.com/tlikonen/cl-eval-bot"
SRC_URI="https://github.com/tlikonen/cl-eval-bot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-irc
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/babel
"
