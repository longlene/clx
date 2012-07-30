# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-geosciences/mapnik/mapnik-0.6.1-r2.ebuild,v 1.1 2010/03/07 21:15:50 nerdboy Exp $

EAPI=2

PYTHON_DEPEND="python? 2"
inherit eutils python distutils toolchain-funcs versionator

DESCRIPTION="A Free Toolkit for developing mapping applications."
HOMEPAGE="http://www.mapnik.org/"
SRC_URI="mirror://berlios/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="cairo curl debug doc +gdal postgres python sqlite"

RDEPEND="dev-libs/boost
	dev-libs/icu
	dev-libs/libxml2
	media-fonts/dejavu
	media-libs/freetype:2
	media-libs/jpeg
	media-libs/libpng
	media-libs/tiff
	sci-libs/proj
	x11-libs/agg[truetype]
	cairo? (
		x11-libs/cairo
		dev-cpp/cairomm
	)
	curl? ( net-misc/curl )
	gdal? ( sci-libs/gdal )
	postgres? (
		>=dev-db/postgresql-base-8.0
		>=dev-db/postgis-1.1.2
	)
	python? ( dev-libs/boost[python] )
	sqlite? ( dev-db/sqlite:3 )
"
DEPEND="${RDEPEND}
	>=dev-util/scons-1.0.0"

src_prepare() {
	sed -i \
		-e "s|/usr/local|/usr|g" \
		-e "s|Action(env\[config\]|Action('%s --help' % env\[config\]|" \
		SConstruct || die

	sed -i \
		-e "s:mapniklibpath + '/fonts':'/usr/share/fonts/dejavu/':g" \
	    bindings/python/SConscript || die "sed 1 failed"
	rm -rf agg || die
	epatch "${FILESDIR}"/${P}-libagg.patch
}

src_configure() {
	MAKEOPTS="SYSTEM_FONTS=/usr/share/fonts/dejavu"

	MAKEOPTS="${MAKEOPTS} INPUT_PLUGINS="
	use postgres && MAKEOPTS="${MAKEOPTS}postgis,"
	use gdal     && MAKEOPTS="${MAKEOPTS}gdal,ogr,"
	use sqlite   && MAKEOPTS="${MAKEOPTS}sqlite,"
	use curl     && MAKEOPTS="${MAKEOPTS}osm,"
	MAKEOPTS="${MAKEOPTS}shape,raster"

	use cairo  || MAKEOPTS="${MAKEOPTS} CAIRO=false"
	use python || MAKEOPTS="${MAKEOPTS} BINDINGS=none"
	use debug  && MAKEOPTS="${MAKEOPTS} DEBUG=yes"

	use postgres && use sqlite && MAKEOPTS="${MAKEOPTS} PGSQL2SQLITE=yes"

	BOOST_PKG="$(best_version "dev-libs/boost")"
	BOOST_VER="$(get_version_component_range 1-2 "${BOOST_PKG/*boost-/}")"
	export BOOST_VERSION="$(replace_all_version_separators _ "${BOOST_VER}")"
	elog "${P} BOOST_VERSION is ${BOOST_VERSION}"
	export BOOST_INC="/usr/include/boost-${BOOST_VERSION}"
	elog "${P} BOOST_INC is ${BOOST_INC}"
	BOOST_LIBDIR_SCHEMA="$(get_libdir)/boost-${BOOST_VERSION}"
	export BOOST_LIB="/usr/${BOOST_LIBDIR_SCHEMA}"
	elog "${P} BOOST_LIB is ${BOOST_LIB}"

	# Passing things doesn't seem to hit all the right paths; another
	# poster-child for just a bit too much complexity for its own good.
	# See bug #301674 for more info.
#	sed -i -e "s|BOOST_INCLUDE_DIR = None|BOOST_INCLUDE_DIR = \'${BOOST_INC}\'|" \
#		-i -e "s|BOOST_LIB_DIR = None|BOOST_LIB_DIR = \'${BOOST_LIB}\'|" \
	sed -i -e "s|searchDir, LIBDIR_SCHEMA|searchDir, \'${BOOST_LIBDIR_SCHEMA}\'|" \
		-i -e "s|include/boost*|include/boost-${BOOST_VERSION}|" \
		"${S}"/SConstruct || die "sed boost paths failed..."

	scons CXX="$(tc-getCXX)" ${MAKEOPTS} DESTDIR="${D}" configure \
		|| die "scons configure failed"
}

src_compile() {
	scons BOOST_INCLUDES=${BOOST_INC} BOOST_LIBS=${BOOST_LIB} \
		BOOST_VERSION=${BOOST_VERSION} || die "scons make failed"
}

src_install() {
	scons BOOST_INCLUDES=${BOOST_INC} BOOST_LIBS=${BOOST_LIB} \
		BOOST_VERSION=${BOOST_VERSION} install || die "scons install failed"

	if use python ; then
	    fperms 0755 "$(python_get_sitedir)"/mapnik/paths.py
	    dobin utils/stats/mapdef_stats.py
	    insinto /usr/share/doc/${PF}/examples
	    doins utils/ogcserver/*
	fi

	dodoc AUTHORS CHANGELOG README || die
	use doc && { dohtml -r docs/api_docs/python/* || die ; }
}

pkg_postinst() {
	elog ""
	elog "See the home page or the OpenStreetMap wiki for more info, and"
	elog "the installed examples for the default mapnik ogcserver config."
	elog ""
}
