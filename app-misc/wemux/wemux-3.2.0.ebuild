# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Multi-User Tmux"
HOMEPAGE="https://github.com/zolrath/wemux"
SRC_URI="https://github.com/zolrath/wemux/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-misc/tmux
"

src_prepare() {
	sed -i '/etc/{s#/usr/local##}' wemux man/wemux.1 README.md
}

src_install() {
	insinto /etc
	newins wemux.conf.example wemux.conf
	dobin wemux
	doman man/wemux.1
	dodoc README.md
}
