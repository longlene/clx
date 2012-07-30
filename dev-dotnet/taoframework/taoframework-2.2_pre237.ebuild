# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

ESVN_REPO_URI="https://taoframework.svn.sourceforge.net/svnroot/taoframework/trunk"
ESVN_REVISION="237"
inherit eutils subversion mono

DESCRIPTION="Bindings to facilitate cross-platform game-related development utilizing the .NET platform"
HOMEPAGE="http://sourceforge.net/projects/taoframework/"
#SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+cg +devil doc +ffmpeg +freetype +glut +lua +ode +openal +opengl +physfs +sdl"

DEPEND=">=dev-lang/mono-2.0"
RDEPEND="${DEPEND}
	cg? ( media-gfx/nvidia-cg-toolkit )
	devil? ( media-libs/devil )
	ffmpeg? ( media-video/ffmpeg )
	freetype? ( media-libs/freetype )
	glut? ( media-libs/freeglut )
	lua? ( dev-lang/lua )
	ode? ( dev-games/ode )
	openal? (
		media-libs/freealut
		media-libs/openal
	)
	opengl? (
		media-libs/ftgl
		media-libs/glfw
		virtual/opengl
	)
	physfs? ( dev-games/physfs )
	sdl? (
		media-libs/libsdl
		media-libs/sdl-gfx
		media-libs/sdl-image
		media-libs/sdl-mixer
		media-libs/sdl-ttf
		media-libs/sdl-net
		media-libs/smpeg
	)"
DEPEND="${DEPEND}
	dev-util/monodevelop
	doc? ( >=virtual/monodoc-2.0 )"

DOCS=("AUTHORS" "ChangeLog" "NEWS" "README")

CONFIG="Release"

src_prepare() {
	epatch "${FILESDIR}"/"${P}"-disable-matrix3-test.patch
	epatch "${FILESDIR}"/"${P}"-library-versions.patch
}

src_compile() {
	mdtool build --configuration:"${CONFIG}" || die "Build failed"
}

src_install() {
	. "${FILESDIR}"/generate_pkgconfig.eblit

	mono_multilib_comply || die "Multilib compliance failed"

	local dll dlllist project
	for dll in src/*/bin/"${CONFIG}"/*.dll ; do
		dlllist="${dlllist} ${dll}"
		project=`basename "${dll}" .dll`

		cp "src/${project}/${project}.dll.config" "${dll}.config" || die "Copying ${project}.dll.config failed"
		egacinstall "${dll}" || die "Installing ${project} into GAC failed"
	done
	generate_pkgconfig ${dlllist} || die "Generating pkgconfig file failed"

	for alias in tao-cg tao-devil tao-ffmpeg tao-freetype tao-lua tao-ode tao-openal tao-opengl tao-ftgl tao-glfw tao-freeglut tao-physfs tao-sdl ; do
		ln -s taoframework.pc "${D}/usr/$(get_libdir)/pkgconfig/${alias}.pc"
	done

	dodoc $DOCS
}
