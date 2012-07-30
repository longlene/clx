# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2" 

inherit eutils

DESCRIPTION="Yet another gui for mplayer."
HOMEPAGE="http://xt7player.altervista.org/xt7forum/"
SRC_URI="http://wpage.unina.it/aorefice/xt7player_dist/${PN}-src-${PV}.tar.gz"
#enca is used to autoguess subtitles charset from language
#flac will pull in audiotag for flac tagging
#global-hotkeys will pull in xbindkeys to manage global hotkeys
IUSE="enca flac global-hotkeys"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#kde-base/kdelibs:3.5 Is not necessary anymore

RDEPEND="
		>=media-video/mplayer-1.0_rc2[enca?]
        	>=dev-util/gambas-2.6
        	flac? ( media-sound/audiotag )
        	global-hotkeys? ( x11-misc/xbindkeys )
	"

DEPEND="${RDEPEND}"


src_unpack() {
        unpack ${A}
        cd "${S}"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
        dodoc ChangeLog README
	#Create and install .desktop file:
		echo "[Desktop Entry]" >xt7-player/xt7-player.desktop
		echo "Encoding=UTF-8" >>xt7-player/xt7-player.desktop
		echo "Name=xt7-player" >>xt7-player/xt7-player.desktop
		echo "Comment=Yet another gui for mplayer" >>xt7-player/xt7-player.desktop
		echo "Exec=/usr/bin/xt7-player.gambas" >>xt7-player/xt7-player.desktop
		echo "Icon=/usr/share/pixmaps/xt7-player.png" >>xt7-player/xt7-player.desktop
		echo "Terminal=false" >>xt7-player/xt7-player.desktop
		echo "Type=Application" >>xt7-player/xt7-player.desktop
		echo "StartupNotify=true" >>xt7-player/xt7-player.desktop
		echo "Categories=Application;AudioVideo;Audio;Video;Player;" >>xt7-player/xt7-player.desktop
		echo "MimeType=application/ogg;application/x-ogg;application/sdp;application/smil;application/x-smil;application/streamingmedia;application/x-streamingmedia;application/vnd.rn-realmedia;application/vnd.rn-realmedia-vbr;audio/aac;audio/x-aac;audio/m4a;audio/x-m4a;audio/mp1;audio/x-mp1;audio/mp2;audio/x-mp2;audio/mp3;audio/x-mp3;audio/mpeg;audio/x-mpeg;audio/mpegurl;audio/x-mpegurl;audio/mpg;audio/x-mpg;audio/rn-mpeg;audio/scpls;audio/x-scpls;audio/vnd.rn-realaudio;audio/wav;audio/x-pn-windows-pcm;audio/x-realaudio;audio/x-pn-realaudio;audio/x-ms-wma;audio/x-pls;audio/x-wav;video/mpeg;video/x-mpeg;video/x-mpeg2;video/msvideo;video/x-msvideo;video/quicktime;video/vnd.rn-realvideo;video/x-ms-afs;video/x-ms-asf;video/x-ms-wmv;video/x-ms-wmx;video/x-ms-wvxvideo;video/x-avi;video/x-fli;video/x-theora;video/x-matroska;" >>xt7-player/xt7-player.desktop
		dodir /usr/share/applications
		insinto /usr/share/applications
		doins xt7-player/xt7-player.desktop
	#

	#Create and install pixmap file:
		newicon "xt7-player/xt7-player.png" "xt7-player.png"

}
