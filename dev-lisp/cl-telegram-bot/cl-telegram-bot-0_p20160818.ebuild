# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bbbc623b16c936059fc115eaa13f6ab727b398d2"

DESCRIPTION="Telegram Bot API for Common Lisp"
HOMEPAGE="https://github.com/sovietspaceship/cl-telegram-bot"
SRC_URI="https://github.com/sovietspaceship/cl-telegram-bot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/drakma
"
