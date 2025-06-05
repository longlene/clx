# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a093f5b330269f6e6f72f51ef638cca186aee44e"

DESCRIPTION="Load .env files from Common Lisp"
HOMEPAGE="https://github.com/ollelauribostrom/cl-dotenv"
SRC_URI="https://github.com/ollelauribostrom/cl-dotenv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd tests
}
