# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="23c14409dc89538b8a0bb2667a9784a5a72b795f"

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
