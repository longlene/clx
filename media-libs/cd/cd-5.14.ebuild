# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} )

inherit lua

FTGL_VER=2.1.5

DESCRIPTION="CD (Canvas Draw) is a platform-independent graphics library"
HOMEPAGE="http://canvasdraw.sourceforge.net/"
SRC_URI="
	https://sourceforge.net/projects/canvasdraw/files/${PV}/Docs%20and%20Sources/${P}_Sources.tar.gz
	https://downloads.sourceforge.net/project/canvasdraw/${PV}/Docs%20and%20Sources/ftgl-${FTGL_VER}_Sources.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="lua static-libs"

DEPEND="
	dev-libs/pdflib-lite
	media-libs/glu
	media-libs/im
	x11-libs/gtk+
	lua? ( ${LUA_DEPS} )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}

PATCHES=(
	"${FILESDIR}"/fix-build-gcc-14.patch
)

src_prepare() {
	default
	sed '/LIBS += ftgl/{ N; s/.*/SLIB += $(FTGL_LIB)\/libftgl.a/; }' -i tecmake.mak
	sed 's/LIBS += gdk_pixbuf-2.0 pango-1.0 gobject-2.0 gmodule-2.0 glib-2.0/LIBS += gdk_pixbuf-2.0 pango-1.0 harfbuzz gobject-2.0 gmodule-2.0 glib-2.0/' -i tecmake.mak
	sed 's|STDINCS += $(GTK)/include/cairo $(GTK)/include/pango-1.0 $(GTK)/include/glib-2.0|STDINCS += $(GTK)/include/cairo $(GTK)/include/pango-1.0 $(GTK)/include/harfbuzz $(GTK)/include/glib-2.0|' -i tecmake.mak
	sed 's|LIBS += pdflib|LIBS += pdf|' -i tecmake.mak
	sed -i 's/^cd[^\(:\|lua\)].*/\0 cd/g;s/^cdlua[^5].*/\0 cdlua5/g' src/Makefile
	pushd "${WORKDIR}"/ftgl && eapply "${FILESDIR}"/ftgl-2.1.3_rc5-freetype-2.13.3.patch && popd
}

lua_src_compile() {
	local target=(
		cdlua5
		cdluapdf5
		cdluagl5
		cdluacontextplus5
		cdluaim5
	)
	local VER=$(ver_cut 1-2 $(lua_get_version))
	emake \
		-C src \
		USE_LUA$(ver_rs 1- '' ${VER})=Yes \
		LUA_SFX=${VER} \
		LUA_INC=$(lua_get_include_dir) \
		IM_INC=/usr/include/im \
		IMLUA_LIB=$(lua_get_cmod_dir) \
		${target[@]}
}

src_compile() {
	emake -C "${WORKDIR}"/ftgl
	local target=(
		cd
		cdpdf
		cdgl
		cdim
		cdcontextplus
	)
	emake \
		-C src \
		IM_INC=/usr/include/im \
		USE_FTGL=Yes \
		USE_GTK3=Yes \
		${target[@]}

	if use lua; then
		lua_foreach_impl lua_src_compile
	fi
}

lua_src_install() {
	insinto $(lua_get_cmod_dir)
	doins lib/Linux*/Lua*/libcdlua*.so
}

src_install() {
	dolib.so lib/Linux*/*.so
	use static-libs && dolib.a lib/Linux*/*.a

	insinto /usr/include/cd
	doins include/*.h
	if use lua; then
		lua_foreach_impl lua_src_install
	fi
}

