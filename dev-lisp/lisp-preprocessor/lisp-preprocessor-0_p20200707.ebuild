# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cbed5952f3d98c84448c52d12255df9580451383"

DESCRIPTION="Common lisp embedded template engine"
HOMEPAGE="https://github.com/cxxxr/lisp-preprocessor"
SRC_URI="https://github.com/cxxxr/lisp-preprocessor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/trivial-gray-streams
	dev-lisp/trivia
	dev-lisp/cl-ppcre
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if use !test; then
		sed -e '/defsystem "lisp-preprocessor-tests"/,$' \
			-i ${PN}.asd
		rm -rf tests
	fi
}
