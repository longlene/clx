# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $


inherit eutils

LANGUAGES="linguas_hu linguas_tr"

KEYWORDS="amd64"

MY_SUFFIX="-Linux-x86_64"

DESCRIPTION="Free AVI repair & preview program. Precompiled version is ony available for x86_64"
HOMEPAGE="http://divfixpp.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}_v${PV}${MY_SUFFIX}.tar.bz2"
SRC_URI="http://heanet.dl.sourceforge.net/sourceforge/divfixpp/${PN}_v${PV}${MY_SUFFIX}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
IUSE="${LANGUAGES}"


S=${WORKDIR}/${PF/++-/++_v}

pkg_setup() {
	strip-linguas hu tr
}

src_unpack() {
	unpack "${A}" || die "unpack failed"
}

src_install() {
	#
	#Installing the locale for DivFix++
	#
	LOCALEDIR="/usr/share/locale"
	if use linguas_hu ; then
		dodir "${LOCALEDIR}/hu"
		dodir "${LOCALEDIR}/hu/LC_MESSAGES"
		insinto "${LOCALEDIR}/hu/LC_MESSAGES"
		doins "${S}/locale/hu/DivFix++.mo"
	fi	

	if use linguas_tr ; then
		dodir "${LOCALEDIR}/tr"	
		dodir "${LOCALEDIR}/tr/LC_MESSAGES"
		insinto "${LOCALEDIR}/hu/LC_MESSAGES"
		doins "${S}/locale/hu/DivFix++.mo"
	fi

	#
	#Installing the rest of the files.
	#
	dobin "${S}/DivFix++" || die "dobin failed"
	dodoc "${S}/docs/Change.log" "${S}/docs/GPL.txt" "${S}/docs/ReadMe.txt" || die "dodoc failed"
}
