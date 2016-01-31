# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/mythvideo/mythvideo-0.21_p17595.ebuild,v 1.1 2008/08/01 16:35:22 cardoe Exp $

EAPI="2"

MYTHTV_VERSION="v0.24.1-1-g347cd24"
MYTHTV_BRANCH="fixes/0.24"
MYTHTV_REV="347cd2477ad82a7aa75ebe7c686db77465f415dc"
MYTHTV_SREV="347cd24"

inherit multilib versionator

DESCRIPTION="Module for MythTV."
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND=""

MY_PV="${PV%_*}"

# what product do we want
case "${PN}" in
	mythtv)
		REPO="mythtv"
		MY_PN="mythtv"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
	mythtv-bindings)
		REPO="mythtv"
		MY_PN="mythtv"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
	mythweb)
		REPO="mythweb"
		MY_PN="mythweb"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/"
		;;
	nuvexport)
		REPO="nuvexport"
		MY_PN="nuvexport"
		MYTHTV_REV="$NUVEXPORT_REV"
		S="${WORKDIR}/MythTV-${REPO}-${NUVEXPORT_SREV}/"
		;;
	*)
		REPO="mythtv"
		MY_PN="mythplugins"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
esac

# _pre is from SVN trunk while _p and _beta are from SVN ${MY_PV}-fixes
# TODO: probably ought to do something smart if the regex doesn't match anything
[[ "${PV}" =~ (_alpha|_beta|_pre|_rc|_p)([0-9]+) ]] || {
	# assume a tagged release
	MYTHTV_REV="v${PV}"
}

HOMEPAGE="http://www.mythtv.org"
LICENSE="GPL-2"
SRC_URI="mirror://github/MythTV/${REPO}/tarball/${MYTHTV_REV} -> ${REPO}-${PV}.tar.gz"

MTVCONF=${MTVCONF:=""}

SLOT="0"
IUSE="${IUSE} profile debug"

	if [[ -z $MYTHTV_NODEPS ]]
	then
		RDEPEND="${RDEPEND}
				=media-tv/mythtv-${MY_PV}*"
		DEPEND="${DEPEND}
				=media-tv/mythtv-${MY_PV}*
				>=sys-apps/sed-4"
	fi

	if use debug
	then
		myconf="${myconf} --compile-type=debug"
		RESTRICT="strip"
	elif use profile
	then
		myconf="${myconf} --compile-type=profile"
	else
		myconf="${myconf} --compile-type=release"
#		myconf="${myconf} --enable-proc-opt"
	fi

pkg_setup() {
# List of available plugins (needs to include ALL of them in the tarball)
	MYTHPLUGINS=""
	MYTHPLUGINS="${MYTHPLUGINS} mytharchive"
	MYTHPLUGINS="${MYTHPLUGINS} mythbrowser"
	MYTHPLUGINS="${MYTHPLUGINS} mythgallery"
	MYTHPLUGINS="${MYTHPLUGINS} mythgame"
	MYTHPLUGINS="${MYTHPLUGINS} mythmusic"
	MYTHPLUGINS="${MYTHPLUGINS} mythnetvision"
	MYTHPLUGINS="${MYTHPLUGINS} mythnews"
	if [[ ${MY_PV} == "0.24.1" ]]; then
		MYTHPLUGINS="${MYTHPLUGINS} mythvideo"
	fi
	MYTHPLUGINS="${MYTHPLUGINS} mythweather"
	MYTHPLUGINS="${MYTHPLUGINS} mythzoneminder"
}

src_prepare() {
	sed -e 's!PREFIX = /usr/local!PREFIX = /usr!' \
	-i 'settings.pro' || die "fixing PREFIX to /usr failed"

	sed -e "s!QMAKE_CXXFLAGS_RELEASE = -O3 -march=pentiumpro -fomit-frame-pointer!QMAKE_CXXFLAGS_RELEASE = ${CXXFLAGS}!" \
	-i 'settings.pro' || die "Fixing QMake's CXXFLAGS failed"

	sed -e "s!QMAKE_CFLAGS_RELEASE = \$\${QMAKE_CXXFLAGS_RELEASE}!QMAKE_CFLAGS_RELEASE = ${CFLAGS}!" \
	-i 'settings.pro' || die "Fixing Qmake's CFLAGS failed"

	find "${S}" -name '*.pro' -exec sed -i \
		-e "s:\$\${PREFIX}/lib/:\$\${PREFIX}/$(get_libdir)/:g" \
		-e "s:\$\${PREFIX}/lib$:\$\${PREFIX}/$(get_libdir):g" \
	{} \;
}

src_configure() {
	if has ${PN} ${MYTHPLUGINS} ; then
		for x in ${MYTHPLUGINS} ; do
			if [[ ${PN} == ${x} ]] ; then
				myconf="${myconf} --enable-${x}"
			else
				myconf="${myconf} --disable-${x}"
			fi
		done
	else
		die "Package ${PN} is unsupported"
	fi

	chmod +x configure
	econf ${myconf} ${MTVCONF}
}

src_compile() {
	qmake mythplugins.pro || die "eqmake4 failed"
	emake || die "make failed to compile"
}

src_install() {
	if has ${PN} ${MYTHPLUGINS}
	then
		cd "${S}"/${PN}
	else
		die "Package ${PN} is unsupported"
	fi

	einstall INSTALL_ROOT="${D}"
	for doc in AUTHORS COPYING FAQ UPGRADING ChangeLog README
	do
		test -e "${doc}" && dodoc ${doc}
	done
}
