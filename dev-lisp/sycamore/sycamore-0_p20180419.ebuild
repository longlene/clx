# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fd2820fec165ad514493426dea209728f64e6d18"

DESCRIPTION="A fast, purely functional data structure library in Common Lisp"
HOMEPAGE="https://github.com/ndantam/sycamore"
SRC_URI="https://github.com/ndantam/sycamore/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
"
BDEPEND=""
