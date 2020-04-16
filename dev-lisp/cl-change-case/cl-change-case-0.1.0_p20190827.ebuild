# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ceff2a5f8bd845b6cb510c6364176b27a238fd3"

DESCRIPTION="Convert strings between camelCase, param-case, snake_case and more"
HOMEPAGE="https://github.com/rudolfochrist/cl-change-case"
SRC_URI="https://github.com/rudolfochrist/cl-change-case/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || ${PN}-test.asd t
}
