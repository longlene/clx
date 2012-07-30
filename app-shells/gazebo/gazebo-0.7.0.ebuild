# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils python

DESCRIPTION="A 3D multiple robot simulator with dynamics."
HOMEPAGE="http://playerstage.sourceforge.net/index.php?src=gazebo"
SRC_URI="mirror://sourceforge/playerstage/gazebo-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="
	virtual/opengl
	virtual/glut
	>=dev-games/ode-0.039
	>=sci-electronics/player-2.0
	dev-libs/libxml2
	gtk? ( x11-libs/gtk+ )
	wxwindows? ( dev-python/wxpython )
	zlib? ( sys-libs/zlib )
	python? ( dev-lang/python )
	3ds? ( media-libs/lib3ds )
	proj? ( sci-libs/proj )
	gdal? ( sci-libs/gdal )"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0
	python? ( dev-lang/swig )"

IUSE_MODELS="models_avatarheli models_blimp models_clodbuster models_carchassis
		models_factory models_garmingps models_groundplane models_lightsource
		models_monocam models_observercam models_pioneer2at models_pioneer2dx
		models_pioneer2gripper models_peoplebot models_segwayrmp models_shrimp
		models_sicklms200 models_simplesolid models_skydome models_sonyvid30
		models_canonvcc4 models_stereohead models_truthwidget models_wheelchair
		models_b21r models_atrv models_bandit models_road models_terrain"

IUSE="python wxwindows 3ds proj gdal zlib gtk test $IUSE_MODELS"

src_unpack() {
	unpack $A
	cd "$S"

	# Fix sandbox violation, see #185470
	sed -i -e 's;setup.py install;setup.py install --root="${D}";' \
	    libgazebo/bindings/python/Makefile.am \
		gui/wx/Makefile.am || die "Failed to sed Makefile.am"

	# Install examples into /usr/share instead of /usr/src
	sed -i -e 's;src/gazebo;share/gazebo;' $(find examples/ -iname "Makefile.am")

	eautoreconf
}

src_compile() {
	local model cfgmodels

	for model in ${IUSE_MODELS}; do
		cfgmodels="${cfgmodels} $(use_enable ${model} ${model#models_})"
	done

	econf \
		$(use_enable python) \
		$(use_enable wxwindows wxgazebo) \
		$(use_enable gdal gzbuilder) \
		$(use_enable test tests) \
		${cfgmodels} || die "configure failed"

	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	dodoc AUTHORS ChangeLog NEWS README TODO
}

pkg_postinst() {
	if use python; then
		python_version
		python_mod_optimize /usr/$(get_libdir)/python${PYVER}/site-packages/gazebo.py
	fi
}
