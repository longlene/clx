# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Telegram Bot API for Common Lisp"
HOMEPAGE="https://github.com/40ants/cl-telegram-bot"
SRC_URI="https://github.com/40ants/cl-telegram-bot/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/drakma
	test? ( dev-lisp/rove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd tests.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all ChangeLog.rst
}
