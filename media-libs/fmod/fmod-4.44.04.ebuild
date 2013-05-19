# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P=fmodapi$(delete_all_version_separators)linux

DESCRIPTION="music and sound effects library, and a sound processing system"
HOMEPAGE="http://www.fmod.org"
SRC_URI="http://www.fmod.org/index.php/release/version/${MY_P}.tar.gz"

LICENSE="BSD BSD-2 fmod"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE="designer examples tools"

RESTRICT="strip test"

QA_FLAGS_IGNORED="opt/fmodex/tools/fsbanklib/.*"
QA_PREBUILT="opt/fmodex/fmoddesignerapi/api/lib/*
	opt/fmodex/api/lib/*"
QA_TEXTRELS="opt/fmodex/fmoddesignerapi/api/lib/*
	opt/fmodex/api/lib/*"

S=${WORKDIR}/${MY_P}

src_compile() {
	if use examples; then
		if use amd64; then
			emake -j1 fmod_examples CPU=x64
		elif use x86; then
			emake -j1 fmod_examples CPU=x86
		fi
	fi
}

src_install() {
	dodir /opt/fmodex

	if use amd64; then
		rm api/lib/libfmodex-${PV}.so
		rm api/lib/libfmodex.so
		rm api/lib/libfmodexL-${PV}.so
		rm api/lib/libfmodexL.so
		rm fmoddesignerapi/api/lib/libfmodevent-${PV}.so
		rm fmoddesignerapi/api/lib/libfmodevent.so
		rm fmoddesignerapi/api/lib/libfmodeventL-${PV}.so
		rm fmoddesignerapi/api/lib/libfmodeventL.so
		rm fmoddesignerapi/api/lib/libfmodeventnet-${PV}.so
		rm fmoddesignerapi/api/lib/libfmodeventnet.so
		rm fmoddesignerapi/api/lib/libfmodeventnetL-${PV}.so
		rm fmoddesignerapi/api/lib/libfmodeventnetL.so
		rm tools/fsbanklib/celt_encoder.so
		rm tools/fsbanklib/libfsbankex.a
		rm tools/fsbanklib/libmp3lame.so
		rm tools/fsbanklib/twolame.so
	elif use x86; then
		rm api/lib/*64*
		rm fmoddesignerapi/api/lib/*64*
		rm tools/fsbanklib/*64*
	fi

	cp -dpR api "${D}"/opt/fmodex || die

	if use designer; then
		if use examples; then
			cp -dpR fmoddesignerapi "${D}"/opt/fmodex || die
		elif use !examples; then
			rm -r fmoddesignerapi/examples
			cp -dpR fmoddesignerapi "${D}"/opt/fmodex || die
		fi
	fi

	if use examples; then
		cp -dpR examples "${D}"/opt/fmodex || die
	fi

	if use tools; then
		cp -dpR tools "${D}"/opt/fmodex || die
	fi

	dosym /opt/fmodex/api/inc /usr/include/fmodex || die
	if use designer; then
		dosym /opt/fmodex/fmoddesignerapi/api/inc /usr/include/fmoddesigner || die
	fi

	insinto /usr/share/doc/${PF}/pdf
	doins documentation/*.pdf
	insinto /usr/share/doc/${PF}/chm
	doins documentation/*.chm
	dodoc {documentation/*.txt,fmoddesignerapi/*.TXT}
	rm -rf "${D}"/opt/fmodex/{documentation,fmoddesignerapi/*.TXT}

	if use designer; then
		echo LDPATH=\"/opt/fmodex/api/lib:/opt/fmodex/fmoddesignerapi/api/lib\" > "${T}"/65fmodex
	elif use !designer; then
		echo LDPATH=\"/opt/fmodex/api/lib\" > "${T}"/65fmodex
	fi

	doenvd "${T}"/65fmodex
}
