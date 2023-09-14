# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3e327de9def28dd763fd9be995dc54ce7edbb364"

DESCRIPTION="Utilities beyond Alexandria"
HOMEPAGE="https://github.com/TBRSS/serapeum"
SRC_URI="https://github.com/TBRSS/serapeum/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/split-sequence
	dev-lisp/string-case
	dev-lisp/parse-number
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/parse-declarations
	dev-lisp/introspect-environment
	dev-lisp/trivial-cltl2
	dev-lisp/global-vars
	dev-lisp/trivial-file-size
	dev-lisp/trivial-macroexpand-all
"

src_prepare() {
	default
	sed -i '/defsystem "serapeum\/tests/,$d' ${PN}.asd
	rm -r tests
}
