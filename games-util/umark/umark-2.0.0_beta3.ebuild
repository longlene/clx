# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Unreal Tournament 2004 and 2003 benchmarking utility"
HOMEPAGE="http://unrealmark.net/"
MY_PV1=${PV/_beta/-Beta}
MY_PV2=${MY_PV1/./}
MY_P=UMark-for-Linux-v${MY_PV2/./}

S="${WORKDIR}/UMark"
SRC_URI="mirror://sourceforge/ut2k3botbench/${MY_P}.tar.gz
	http://unrealmark.net/dl/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="=x11-libs/gtk+-2*"
RDEPEND="${DEPEND}
	dev-lang/perl"

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	cp -R data ${D}/usr/share/${PN}
	sed -i "s:echo \"\":cd /usr/share/${PN}:" install_umark_data.sh
	dobin install_umark_data.sh
	exeinto /usr/share/${PN}
	doexe utxinfo.pl
	dodoc AUTHORS ChangeLog NEWS README TODO
	doicon pixmaps/umark_icon.png
	make_desktop_entry umark Umark umark_icon.png
}
pkg_postinst() {
	einfo "Please run /usr/bin/install_umark_data.sh for each"
	einfo "user you want to use Umark"
}
