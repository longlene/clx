# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson vcs-snapshot

EGIT_COMMIT="b828da5dc4cf9681ffb0c1ef1153c95b6d3c55c3"

DESCRIPTION="PlUgin Graphics Library"
HOMEPAGE="https://github.com/lv2/pugl"
SRC_URI="https://github.com/lv2/pugl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cairo example opengl test vulkan"

DEPEND="
	x11-libs/libX11
	opengl? ( virtual/opengl )
	cairo? ( x11-libs/cairo )

"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		$(meson_feature cairo)
		$(meson_use example examples)
		$(meson_feature opengl)
		$(meson_use test tests)
		$(meson_feature vulkan)
	)
	meson_src_configure
}
