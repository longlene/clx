# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Helper to authenticate website's users by sending them unique code by email"
HOMEPAGE="https://github.com/40ants/mito-email-auth"
SRC_URI="https://github.com/40ants/mito-email-auth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/log4cl
	dev-lisp/weblocks
	dev-lisp/mailgun
	dev-lisp/local-time
	dev-lisp/uuid
	dev-lisp/mito
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr README.rst
}
