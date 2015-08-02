# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Bindings for the native curses library, a full featured console IO library"
HOMEPAGE="https://github.com/fresc81/node-curses"
#SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/tar
"

src_compile() {
	if use amd64; then
		sh gcc-build-x64.sh
	elif use x86; then
		sh gcc-build-ia32.sh
	elif use arm; then
		sh gcc-build-arm.sh
	fi
}
