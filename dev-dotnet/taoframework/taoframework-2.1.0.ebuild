# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mono multilib subversion

EAPI=0
DESCRIPTION="Various .NET and Mono Bindings"
HOMEPAGE="http://www.taoframework.com/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
ESVN_REPO_URI="http://taoframework.svn.sourceforge.net/svnroot/${PN}/tags/${P}/"
ESVN_PROJECT="${PN}"

IUSE="cg devil ffmpeg freeglut freetype glfw lua ode openal opengl physfs sdl X"

RDEPEND="
	cg? ( >=media-gfx/nvidia-cg-toolkit-1.4.1 )
	devil? ( >=media-libs/devil-1.6.8_rc2 )
	ffmpeg? ( >=media-video/ffmpeg-0.4.9 )
	freeglut? ( >=media-libs/freeglut-2.4.0 )
	freetype? ( >=media-libs/freetype-2 )
	glfw? ( >=media-libs/glfw-2.5.0 )
	lua? ( >=dev-lang/lua-5.1.1 )
	ode? ( >=dev-games/ode-0.6 )
	openal? ( media-libs/openal )
	opengl? ( virtual/opengl )
	physfs? ( >=dev-games/physfs-1.0.1 )
	sdl? ( >=media-libs/libsdl-1.2.11 )
	X? ( x11-libs/libX11 )
	"
DEPEND="${RDEPEND}
	dev-dotnet/nant
	sys-apps/sed
	"

src_compile() {
	nant build-release
}

tao_install_with_doc() {
	MY_FLAG="$1"
	MY_LIB="Tao.$2"
	if use $MY_FLAG; then
		cp ${S}/src/${MY_LIB}/${MY_LIB}.dll.config ${S}/src/${MY_LIB}/bin/Release/${MY_LIB}.dll.config
		ebegin "Installing and registering ${MY_LIB}"
                gacutil -i ${S}/src/${MY_LIB}/bin/Release/${MY_LIB}.dll -root "${D}"/usr/$(get_libdir) \
                        -gacdir /usr/$(get_libdir) -package ${MY_LIB} &>/dev/null
                eend $? || die "Failed installing ${MY_LIB}"
		newdoc ${S}/src/${MY_LIB}/README README.${MY_FLAG}
		newdoc ${S}/src/${MY_LIB}/NEWS NEWS.${MY_FLAG}
		newdoc ${S}/src/${MY_LIB}/AUTHORS AUTHORS.${MY_FLAG}
		newdoc ${S}/src/${MY_LIB}/INSTALL INSTALL.${MY_FLAG}
	fi
}

src_install() {
	tao_install_with_doc cg Cg
	tao_install_with_doc devil DevIl
	tao_install_with_doc ffmpeg FFmpeg
	tao_install_with_doc freeglut FreeGlut
	tao_install_with_doc freetype FreeType
	tao_install_with_doc glfw Glfw
	tao_install_with_doc lua Lua
	tao_install_with_doc ode Ode
	tao_install_with_doc openal OpenAl
	tao_install_with_doc opengl OpenGl
	tao_install_with_doc physfs PhysFs
	tao_install_with_doc sdl Sdl
	tao_install_with_doc X Platform.X11
	dodoc README
	dodoc INSTALL
	dodoc AUTHORS
	dodoc NEWS
	dodoc TODO
}
