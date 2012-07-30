# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

CMAKE_USE_DIR="${S}/code"

inherit cmake-utils subversion toolchain-funcs

DESCRIPTION="blend of first person shooter and tank combat"
HOMEPAGE="http://www.zeroballistics.com/"
ESVN_REPO_URI="https://zeroballistics.svn.sourceforge.net/svnroot/zeroballistics/tags/v2.0"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="=dev-games/cegui-0.6*[opengl]
	>=dev-games/ode-0.11.1
	>=dev-games/openscenegraph-2.8.3
	>=dev-libs/boost-1.41.0-r3
	>=dev-libs/ferrisloki-3.0.3
	>=dev-libs/tinyxml-2.6.1
	>=media-libs/freealut-1.1.0
	>=media-libs/freeglut-2.6.0
	>=media-libs/libsdl-1.2.13-r1
	>=media-libs/libvorbis-1.3.1
	>=media-libs/openal-1.11.753
	>=virtual/glu-7.0
	>=virtual/opengl-7.0
	>=x11-libs/libdrm-2.4.20
	|| ( >=x11-libs/libX11-1.3.4[xcb] >=x11-libs/libX11-1.4.0 )
	>=x11-libs/libXau-1.0.5
	>=x11-libs/libxcb-1.6
	>=x11-libs/libXdamage-1.1.3
	>=x11-libs/libXdmcp-1.0.3
	>=x11-libs/libXext-1.1.2
	>=x11-libs/libXfixes-4.0.5
	>=x11-libs/libXxf86vm-1.1.0
	doc? ( app-doc/doxygen )"

RDEPEND="=dev-games/cegui-0.6*[opengl]
	>=dev-games/ode-0.11.1
	>=dev-games/openscenegraph-2.8.3
	>=dev-libs/boost-1.41.0-r3
	>=dev-libs/ferrisloki-3.0.3
	>=dev-libs/tinyxml-2.6.1
	>=media-libs/freealut-1.1.0
	>=media-libs/freeglut-2.6.0
	>=media-libs/libsdl-1.2.13-r1
	>=media-libs/libvorbis-1.3.1
	>=media-libs/openal-1.11.753
	>=virtual/glu-7.0
	>=virtual/opengl-7.0
	>=x11-libs/libdrm-2.4.20
	|| ( >=x11-libs/libX11-1.3.4[xcb] >=x11-libs/libX11-1.4.0 )
	>=x11-libs/libXau-1.0.5
	>=x11-libs/libxcb-1.6
	>=x11-libs/libXdamage-1.1.3
	>=x11-libs/libXdmcp-1.0.3
	>=x11-libs/libXext-1.1.2
	>=x11-libs/libXfixes-4.0.5
	>=x11-libs/libXxf86vm-1.1.0"

src_prepare() {
	local cegui_include=$($(tc-getPKG_CONFIG) --variable=includedir CEGUI)

	cd code
	find bluebeard libs -name CMakeLists.txt -exec \
		sed -i	"1i\include_directories(/usr/include/FerrisLoki)" \{\} \;

	find bluebeard games tools/*viewer -name CMakeLists.txt -exec \
		sed -i s:"/usr/local/include/CEGUI":"$cegui_include \
			/usr/include/CEGUI":g \{\} \;

	cd ..
	subversion_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	eerror "Incomplete ebuild! Not installing anything!"
}
