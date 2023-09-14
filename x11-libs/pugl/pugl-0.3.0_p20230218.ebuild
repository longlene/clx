# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="9b5a0871c1a8771dbe204e60f437653a67abd42a"

DESCRIPTION="PlUgin Graphics Library"
HOMEPAGE="https://github.com/lv2/pugl"
SRC_URI="https://gitlab.com/lv2/pugl/-/archive/${EGIT_COMMIT}/pugl-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
		$(meson_feature example examples)
		$(meson_feature opengl)
		$(meson_feature test tests)
		$(meson_feature vulkan)
	)
	meson_src_configure
}
