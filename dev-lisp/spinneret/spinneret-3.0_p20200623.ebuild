# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9db014abca69617530c009f2a61b0baee7702bf1"

DESCRIPTION="Common Lisp HTML5 generator"
HOMEPAGE="https://github.com/ruricolist/spinneret"
SRC_URI="https://github.com/ruricolist/spinneret/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/global-vars
	dev-lisp/serapeum
	dev-lisp/trivial-gray-streams
	dev-lisp/cl-markdown
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "spinneret\/tests/,$d' ${PN}.asd
		rm tests.lisp
	fi
}
