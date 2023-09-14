# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp Telegram Bot API"
HOMEPAGE="https://github.com/gzip4/cl-telebot/"
SRC_URI="https://github.com/gzip4/cl-telebot/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/jonathan
	dev-lisp/alexandria
"
BDEPEND=""
