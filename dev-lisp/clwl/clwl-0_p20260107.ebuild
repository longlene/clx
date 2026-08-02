# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp Wayland & wlroots bindings"
HOMEPAGE="https://github.com/calsys456/clwl"
SRC_URI="https://github.com/calsys456/clwl/archive/38f94b0838fe1145d12db8463d1d710d9f4385b5.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-38f94b0838fe1145d12db8463d1d710d9f4385b5"

LICENSE="0BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-lisp/cffi
	dev-libs/wayland
	gui-libs/wlroots
	x11-libs/libxkbcommon
	x11-libs/pixman
"

DOCS=( README.md )
