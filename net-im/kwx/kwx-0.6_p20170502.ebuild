# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="3855bc3193d99e373d5df6c367e5dfd346b9cac1"

DESCRIPTION="WeChat KDE frontend"
HOMEPAGE="https://github.com/xiangzhai/qwx"
SRC_URI="https://github.com/xiangzhai/qwx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	kde-frameworks/kdbusaddons
	kde-frameworks/kdeclarative
	kde-frameworks/ki18n
	kde-frameworks/kxmlgui
	kde-frameworks/prison
	dev-qt/qtdeclarative
	dev-qt/qtgraphicaleffects
	dev-qt/qtquickcontrols
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/TerminalOptions=/d' \
		-e '/Path=/{s#$#/usr/bin/kwx#}' \
		-i src/kwx.desktop || die
}
