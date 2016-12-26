# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/go-vgo/robotgo"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="RobotGo,Go Native cross-platform system automation"
HOMEPAGE="https://github.com/go-vgo/robotgo"
SRC_URI="https://github.com/go-vgo/robotgo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/libpng
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXtst
	x11-libs/libxcb
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/cgo linux/{s#I/usr/src#I/usr/src -std=c11#}' src/${EGO_PN}/robotgo.go
}

src_install() {
	golang-build_src_install
	dodoc README.md
}
