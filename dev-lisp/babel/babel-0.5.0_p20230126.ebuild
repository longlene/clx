# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="627d6a60d0ffc82a3687b39ba8a99128031504d9"

DESCRIPTION="A charset conversion library"
HOMEPAGE="https://github.com/cl-babel/babel"
SRC_URI="https://github.com/cl-babel/babel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}
