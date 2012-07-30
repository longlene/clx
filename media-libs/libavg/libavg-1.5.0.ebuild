inherit eutils python flag-o-matic

DESCRIPTION="libavg is an engine for media installations"
HOMEPAGE="www.libavg.de"
SRC_URI="http://www.libavg.de/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="ieee1394"
RESTRICT="test"

#Does media-gfx/imagemagick need to go?
DEPEND="media-gfx/imagemagick
        media-gfx/graphicsmagick
        media-video/ffmpeg
        media-libs/libsdl
        dev-libs/libxml2
        x11-libs/pango
        ieee1394? ( =media-libs/libdc1394-1* )
        dev-libs/boost"

pkg_setup() {
        
        append-ldflags $(no-as-needed)
        #Ugg, I suppose this could be fixed with http://www.gentoo.org/proj/en/qa/asneeded.xml#doc_chap2_sect3

        if ! built_with_use media-libs/libsdl opengl X; then
                einfo "Please re-emerge media-libs/libsdl with the opengl and X USE flags set."
                die "libsdl needs opengl and X USE flags set."
        fi
}

src_compile() {
# TODO: configure using --with-boost-thread=mt
        econf `use_enable ieee1394 dc1394` || die "econf failed"
        emake || die "emake failed"
}

src_install () {
        einstall || die "install failed"
}
