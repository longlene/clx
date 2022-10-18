# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="c0c1e57d8fe8c63216dc9f130e67415a46c7488f"

DESCRIPTION="The missing small and fast image decoding library for humans"
HOMEPAGE="https://github.com/HappySeaFox/sail"
SRC_URI="https://github.com/HappySeaFox/sail/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+apng avif gif +jpeg +png +tiff +webp"

DEPEND="
	apng? ( media-libs/libpng[apng] )
	avif? ( media-libs/libavif )
	gif? ( media-libs/giflib )
	jpeg? ( media-libs/libjpeg-turbo )
	png? ( media-libs/libpng )
	tiff? ( media-libs/tiff )
	webp? ( media-libs/libwebp )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local x
	local enabled
	local disabled
	for x in apng avif gif jpeg png tiff webp ; do
		if use $x ; then
			enabled+=" $x"
		else
			disabled+=" $x"
		fi
	done
	local mycmakeargs=(
		-DSAIL_BUILD_EXAMPLES=OFF
		-DSAIL_BUILD_TESTS=OFF
		-DSAIL_ENABLE_CODECS=$enabled
		-DSAIL_DISABLE_CODECS=$disabled
	)
	cmake_src_configure
}
