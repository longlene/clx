# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils

MY_P="${PN}-source-${PV}"

DESCRIPTION="A free 3D modeling, animation, and rendering system"
HOMEPAGE="http://www.k-3d.org/"
SRC_URI="mirror://sourceforge/k3d/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="3ds cgal cuda dbus gmm gnome graphviz gts imagemagick inotify jpeg nls ode openexr perftools png python threads tiff truetype" #TODO collada-dom

RDEPEND="
	dev-libs/boost[python?]
	>=dev-cpp/glibmm-2.6
	>=dev-cpp/gtkmm-2.6
	media-libs/mesa
	>=x11-libs/gtkglext-1.0.6-r3
	>=dev-libs/libsigc++-2.2
	virtual/opengl
	virtual/glu
	|| ( dev-libs/expat dev-libs/libxml2 )
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXmu
	x11-libs/libXt
	3ds? ( media-libs/lib3ds )
	cgal? ( sci-mathematics/cgal )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	dbus? ( dev-libs/dbus-glib )
	gmm? ( sci-mathematics/gmm )
	gnome? ( gnome-base/gnome-vfs )
	graphviz? ( media-gfx/graphviz )
	gts? ( sci-libs/gts )
	imagemagick? ( media-gfx/imagemagick )
	ode? ( dev-games/ode )
	openexr? ( media-libs/openexr )
	jpeg? ( media-libs/jpeg )
	perftools? ( dev-util/google-perftools )
	png? ( media-libs/libpng )
	python? ( >=dev-lang/python-2.3
			  dev-python/cgkit )
	threads? ( dev-cpp/tbb )
	tiff? ( media-libs/tiff )
	truetype? ( >=media-libs/freetype-2 )"
DEPEND="${RDEPEND}
	>=dev-util/cmake-2.6
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

S="${WORKDIR}/${MY_P}"

DOCS="AUTHORS README"

# k3d_use_enable()
#
# $1: use flag. ON|OFF is determined by this.
# $2: part of cmake variable name which will be appended to the base variable name
#
# e.g.) USE=nls k3d_use_enable nls NLS #=> "-DK3D_ENABLE_NLS=ON"
#
k3d_use_enable() {
	echo "-DK3D_ENABLE_$2=$(use $1 && echo ON || echo OFF)"
}

k3d_use_module() {
	echo "-DK3D_BUILD_$2_MODULE=$(use $1 && echo ON || echo OFF)"
}

src_configure() {
	if [[ $(gcc-major-version) -lt 4 ]]; then
		append-cxxflags -fno-stack-protector
	fi

	mycmakeargs="
		$(k3d_use_module 3ds 3DS_IO)
		$(k3d_use_module cgal CGAL)
		$(k3d_use_module cuda CUDA)
		$(k3d_use_module dbus COMPIZ)
		$(k3d_use_module gnome GNOME)
		$(k3d_use_module graphviz GRAPHVIZ)
		$(k3d_use_module gmm PGP_REMESH)
		$(k3d_use_module gts GTS)
		$(k3d_use_module gts GTS_IO)
		$(k3d_use_module imagemagick IMAGEMAGICK_IO)
		$(k3d_use_module inotify INOTIFY)
		$(k3d_use_module jpeg JPEG_IO)
		$(k3d_use_enable nls NLS)
		$(k3d_use_module ode ODE)
		$(k3d_use_module openexr OPENEXR_IO)
		$(k3d_use_module perftools GOOGLE_PERFTOOLS)
		$(k3d_use_module png PNG_IO)
		$(k3d_use_enable python PYTHON)
		$(k3d_use_module python PYTHON)
		$(k3d_use_module python NGUI_PYTHON_SHELL)
		$(k3d_use_module python PYUI)
		$(k3d_use_enable threads PARALLEL)
		$(k3d_use_module tiff TIFF_IO)
		$(k3d_use_module truetype FREETYPE2)"

	cmake-utils_src_configure
}
