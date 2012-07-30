# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI="2"
inherit eutils flag-o-matic bash-completion

DESCRIPTION="Interpreter for a script language dedicated to the design of
image processing pipelines"
HOMEPAGE="http://gmic.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}.tar.gz"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X png jpeg tiff ffmpeg zlib graphicsmagick openexr \
fftw board gimp bash-completion opencv"

RDEPEND="X? ( x11-libs/libX11
			  x11-libs/libXext
			  x11-libs/libXrandr )
		 png? ( media-libs/libpng )
		 jpeg? ( media-libs/jpeg )
		 tiff? ( media-libs/tiff )
		 ffmpeg? ( media-video/ffmpeg )
		 zlib? ( sys-libs/zlib )
		 graphicsmagick? ( media-gfx/graphicsmagick )
		 openexr? ( media-libs/openexr )
		 fftw? ( sci-libs/fftw )
		 board? ( media-libs/libboard )
		 gimp? ( =media-plugins/gimp-gmic-${PV}* )
		 bash-completion? ( app-shells/bash-completion )
		 opencv? ( media-libs/opencv )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S=${WORKDIR}/${PN}-${PV}/src

src_unpack() {
	unpack ${A} || die "Unpack failed"
}

src_compile() {
	local UNIX_CFLAGS UNIX_LDFLAGS
	UNIX_CFLAGS+="-Dgmic_build -I/usr/include -I/include"
	UNIX_LDFLAGS+="-lm -L/lib"
	if use X; then
		UNIX_CFLAGS+=" -Dcimg_display=1 -Dcimg_use_xrandr \
-I/usr/X11R6/include -Dcimg_use_xshm"
		UNIX_LDFLAGS+=" -L/usr/X11R6/lib -lX11 -lXrandr -lpthread \
-L/usr/X11R6/lib -lXext"
	fi
	if use png; then
		UNIX_CFLAGS+=" -Dcimg_use_png"
		UNIX_LDFLAGS+=" -lpng -lz"
	fi
	if use jpeg; then
		UNIX_CFLAGS+=" -Dcimg_use_jpeg"
		UNIX_LDFLAGS+=" -ljpeg"
	fi
	if use tiff; then
		UNIX_CFLAGS+=" -Dcimg_use_tiff"
		UNIX_LDFLAGS+=" -ltiff"
	fi
	if use ffmpeg; then
		UNIX_CFLAGS+=" -Dcimg_use_ffmpeg -I/usr/include/libavcodec \
-I/usr/include/libavformat -I/usr/include/libswscale \
-I/usr/include/ffmpeg -D__STDC_CONSTANT_MACROS"
		UNIX_LDFLAGS+=" -lavcodec -lavformat -lswscale"
	fi
	if use zlib; then
		UNIX_CFLAGS+=" -Dcimg_use_zlib"
		UNIX_LDFLAGS+=" -lz"
	fi
	if use graphicsmagick; then
		UNIX_CFLAGS+=" -Dcimg_use_magick -I/usr/include/GraphicsMagick"
		UNIX_LDFLAGS+=" -lGraphicsMagick++"
	fi
	if use openexr; then
		UNIX_CFLAGS+=" -Dcimg_use_openexr -I/usr/include/OpenEXR"
		UNIX_LDFLAGS+=" -lIlmImf"
	fi
	if use fftw; then
		UNIX_CFLAGS+=" -Dcimg_use_fftw3"
		UNIX_LDFLAGS+=" -lfftw3"
	fi
	if use board; then
		UNIX_CFLAGS+=" -Dcimg_use_board"
		UNIX_LDFLAGS+=" -lboard"
	fi
	if use opencv; then
		UNIX_CFLAGS+=" -Dcimg_use_opencv -I/usr/include/opencv"
		UNIX_LDFLAGS+=" -lcv -lhighgui"
	fi

	emake "CFLAGS+=${CXXFLAGS} ${UNIX_CFLAGS}" \
		"LDFLAGS+=${UNIX_LDFLAGS}" gmic_gmic \
		|| die "Compilation of gmic failed"
}

src_install() {
	exeinto "/usr/bin"
	doexe gmic || die "Installation of gmic failed"
	dodoc ../ChangeLog ../COPYING ../README || die "dodoc failed"
	doman ../man/* || die "doman failed"
	if use bash-completion; then
		dobashcompletion gmic_bashcompletion.sh gmic \
			|| die "Cannot install bash completion"
	fi
	insinto /usr/include
	doins CImg.h
}
