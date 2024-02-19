# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="e33b2f6b0cea6d6263990aa9abe6a69fdfba5973"

DESCRIPTION="PlUgin Graphics Library"
HOMEPAGE="https://github.com/lv2/pugl"
SRC_URI="https://gitlab.com/lv2/pugl/-/archive/${EGIT_COMMIT}/pugl-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cairo doc example opengl test vulkan"

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
		$(meson_feature doc docs)
		$(meson_feature example examples)
		$(meson_feature opengl)
		$(meson_feature test tests)
		$(meson_feature vulkan)
	)
	meson_src_configure
}
