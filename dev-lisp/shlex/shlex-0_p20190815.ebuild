# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="68523280b874f75ad10c175751bedcef5aeb40ff"

DESCRIPTION="Lexical analyzer for simple shell-like syntax"
HOMEPAGE="https://github.com/ruricolist/cl-shlex"
SRC_URI="https://github.com/ruricolist/cl-shlex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/cl-ppcre
	dev-lisp/cl-unicode
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "shlex\/test/,$d' ${PN}.asd
		rm -r t
	fi
}
