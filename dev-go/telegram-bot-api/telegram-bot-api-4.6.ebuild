# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/telegram-bot-api.v4"

DESCRIPTION="Golang bindings for the Telegram Bot API"
HOMEPAGE="https://github.com/go-telegram-bot-api/telegram-bot-api"
SRC_URI="https://github.com/go-telegram-bot-api/telegram-bot-api/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/multipartstreamer
"
RDEPEND="${DEPEND}"
