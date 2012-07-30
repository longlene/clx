# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils multilib toolchain-funcs

RADIANT_MAJOR_VERSION="5"
RADIANT_MINOR_VERSION="0"
DESCRIPTION="NetRadiant is a fork of map editor for Q3 based games, GtkRadiant 1.5"
HOMEPAGE="http://dev.alientrap.org/projects/netradiant"
BASE_ZIP_URI="http://ingar.satgnu.net/files/gtkradiant/gamepacks/"
SRC_URI="http://rion-overlay.googlecode.com/files/${P}.tar.xz
	osirion? ( ${BASE_ZIP_URI}/OsirionPack.zip )
	warsow? ( ${BASE_ZIP_URI}/WarsowPack.zip )
	!bindist? (
		openarena? ( ${BASE_ZIP_URI}/OpenArenaPack.zip )
		quake? ( ${BASE_ZIP_URI}/QuakePack.zip )
		quake2? ( ${BASE_ZIP_URI}/Quake2Pack.zip )
		tremulous? ( ${BASE_ZIP_URI}/TremulousPack.zip )
	)
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RADIANT_GPL_PACKS="darkplaces nexuiz osirion quake2world warsow +xonotic"
RADIANT_NONGPL_PACKS="openarena quake quake2 tremulous"
RADIANT_TOOLS="h2data q2map q3data q3map2 qdata3"
RADIANT_PACKS="${RADIANT_GPL_PACKS} ${RADIANT_NONGPL_PACKS}"
RADIANT_BINS=" ${RADIANT_TOOLS} gtk"
IUSE="${RADIANT_PACKS} ${RADIANT_BINS// / +} bindist"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	>=media-libs/libpng-1.2
	>=sys-libs/zlib-1.2
	gtk? (
		>=x11-libs/gtk+-2.4:2
		>=x11-libs/gtkglext-1
		x11-libs/pango
	)
	!dev-games/gtkradiant
"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	dev-util/pkgconfig
	osirion? ( app-arch/unzip )
	warsow? ( app-arch/unzip )
	!bindist? (
		openarena? ( app-arch/unzip )
		quake? ( app-arch/unzip )
		quake2? ( app-arch/unzip )
		tremulous? ( app-arch/unzip )
	)
"

radiant_zip_unpack() {
		if use ${1,,}; then
			cd "${WORKDIR}/packs/" || die
			unpack "${1}Pack.zip"
			mv ${1}Pack ${1,,} || die
		fi
}

pkg_setup() {
	targets=""
	for i in ${RADIANT_BINS};do
		if use $i; then
			targets+=" ${i/gtk/radiant}"
		fi
	done
	if [ "x$targets" = "x" ]; then
		targets=" q3map2"
		ewarn "You disabled all binaries: defaulting to USE=\"q3map2\""
	fi
}

src_unpack() {
	unpack ${P}.tar.xz

	if use gtk; then
		radiant_zip_unpack Osirion
		radiant_zip_unpack Warsow

		if use !bindist; then
			MY_RADIANT_PACKS="${RADIANT_GPL_PACKS//+/} ${RADIANT_NONGPL_PACKS}"
			radiant_zip_unpack OpenArena
			radiant_zip_unpack Quake
			radiant_zip_unpack Quake2
			radiant_zip_unpack Tremulous
		else
			MY_RADIANT_PACKS="${RADIANT_GPL_PACKS//+/}"
			for i in ${RADIANT_NONGPL_PACKS}; do
				if use ${i}; then
					ewarn "USE bindist disables ${i} non GPL pack"
				fi
			done
		fi
	fi
}

src_prepare() {
	sed -e '/$(INSTALLDIR)/s,heretic2/h2data,/h2data,' \
		-i Makefile || die
}

src_configure() {
	tc-export CC CXX AR RANLIB

	export TEE_STDERR=""

	# dependencies-check wants gtk
	if use gtk; then
		emake dependencies-check
	fi
}

src_compile() {
	emake ${targets// / binaries-}
}

src_install() {
	insinto /usr/$(get_libdir)/${PN}
	doins \
		setup/data/tools/q3data.qdt

	dodoc ChangeLog ChangeLog.idsoftware CONTRIBUTORS TODO tools/quake3/q3map2/changelog.q3map{1,2.txt}

	pushd install || die
	exeinto /usr/$(get_libdir)/${PN}
	for i in ${targets}; do
		doexe ${i}.x86
		dosym /usr/$(get_libdir)/${PN}/${i}.x86 /usr/bin/${i}
	done

	# radiant
	if use gtk; then
		dosym /usr/$(get_libdir)/${PN}/radiant.x86 /usr/bin/${PN}

		newicon "${S}"/icons/radiant-src.png ${PN}.png
		make_desktop_entry ${PN} NetRadiant ${PN} "Development;GTK;"

		# modules
		insinto /usr/$(get_libdir)/${PN}/modules
		doins modules/*.so

		# plugins
		insinto /usr/$(get_libdir)/${PN}/plugins
		doins plugins/*.so

		# data
		popd || die
		echo "$RADIANT_MINOR_VERSION" > RADIANT_MINOR || die
		echo "$RADIANT_MAJOR_VERSION" > RADIANT_MAJOR || die
		insinto /usr/$(get_libdir)/${PN}
		doins -r \
			RADIANT_MAJOR \
			RADIANT_MINOR \
			setup/data/tools/bitmaps \
			setup/data/tools/gl \
			setup/data/tools/global.xlink \
			setup/data/tools/plugins \
			docs

		# packs
		for x in ${MY_RADIANT_PACKS//+/}; do
			if use $x; then
				cd "${WORKDIR}"/packs/${x} || die
				# USE and dir names differ
				n="$(echo $x | sed \
					-e 's/^quake/q/' \
					-e 's/^q$/q1/' \
					-e 's/2world$/2w/' \
					-e 's/^openarena/oa/' \
					-e 's/^tremulous/trem/' \
				)"
				insinto /usr/$(get_libdir)/${PN}
				doins -r ${n}.game

				insinto /usr/$(get_libdir)/${PN}/games
				doins games/${n}.game
			fi
		done
	fi
}
