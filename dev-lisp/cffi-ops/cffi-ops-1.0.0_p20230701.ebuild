# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="47a3efa90b470fb4b0ab40e7dbc7c876cb9b7869"

DESCRIPTION="A Common Lisp library that helps write concise CFFI-related code"
HOMEPAGE="https://github.com/bohonghuang/cffi-ops"
SRC_URI="https://github.com/bohonghuang/cffi-ops/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/arrow-macros
	dev-lisp/trivial-macroexpand-all
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem cffi-ops\/test/,$d' \
		-i cffi-ops.asd
	rm -rf test
}
