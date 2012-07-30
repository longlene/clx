# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit flag-o-matic
inherit toolchain-funcs

DESCRIPTION="Command line sequenced binaural beat generator"
HOMEPAGE="http://sbagen.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz
	vorbis? ( sounds? ( http://uazu.net/sbagen/sbagen-river-1.4.1.tgz ) )"

LICENSE="GLP2"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE="mp3 vorbis sounds"

DEPEND="mp3? ( media-libs/libmad )
	vorbis? ( dev-util/subversion )"

src_compile()
{
	if use vorbis; then
		svn co http://svn.xiph.org/trunk/Tremor/
		cd Tremor
		sh autogen.sh
		emake || die "Tremor: compilation failed"
		cp .libs/libvorbisidec.a ivorbiscodec.h ivorbisfile.h ogg.h os_types.h config_types.h ../libs/ || die "Tremor: not all expected files are present"
		append-flags -DOGG_DECODE
		LIBS=libs/libvorbisidec.a
		cd ..
	fi
	if use mp3; then
		append-flags -DMP3_DECODE
		LIBS="${LIBS} /usr/lib/libmad.a"
	fi
	$(tc-getCC) ${CFLAGS} -DT_LINUX -Wall -lm -lpthread ${LDFLAGS} sbagen.c $LIBS -o sbagen || die "Sbagen: compilation failed"
}

src_install()
{
	exeinto /usr/bin
	doexe sbagen

	insinto /usr/share/sbagen
	doins *.sbg
	if use vorbis && use sounds; then
		doins ${WORKDIR}/${PN}-1.4.1/*.ogg
	fi

	dodoc *.txt
}

