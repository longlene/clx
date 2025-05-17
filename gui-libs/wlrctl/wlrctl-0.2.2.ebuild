# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A command line utility for miscellaneous wlroots Wayland extensions"
HOMEPAGE="https://git.sr.ht/~brocellous/wlrctl"
SRC_URI="https://git.sr.ht/~brocellous/wlrctl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc zsh-completion"

DEPEND="
	dev-libs/wayland
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"
BDEPEND="
	doc? ( app-text/scdoc )
"

S="${WORKDIR}"/${PN}-v${PV}

src_configure() {
	local emesonargs=(
		$(meson_use zsh-completion zsh-completions)
		$(meson_feature doc man-pages)
	)
	meson_src_configure
}
