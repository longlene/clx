# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SLOT="0"

LICENSE="GPL-2"

KEYWORDS="x86 amd64"

DESCRIPTION="Brazilian and Portuguese Native Keyboards: Native, International, Dvorak"

SRC_URI="http://tecladobrasileiro.com.br/gentoo/${PF}.tar.bz2"

HOMEPAGE="http://tecladobrasileiro.com.br"

IUSE="X"

RDEPEND="sys-apps/kbd 
	X? ( virtual/x11 )"

# xkeyboard-config
# xkbdata

src_install() {
	cp -R $WORKDIR/$PF/console/usr $D
        cp -R $WORKDIR/$PF/xorg/usr $D
}

pkg_postinst() {

	if use X ; then
		einfo "";
		einfo "";
		einfo "";
		einfo "Do not forget to run etc-update after the merge, or else the xorg maps won't work";
		einfo "To use the console keymaps, use either br-nativo, br-internacional, pt-nativo, pt-internacional or br-dvorak in /etc/conf.d/keymaps";
		einfo "To use the console keymaps, use either br-nativo, br-internacional, pt-nativo,";
                einfo "     pt-internacional or br-dvorak in /etc/conf.d/keymaps";
		einfo "To learn more about the xorg maps, check our website"
		einfo "";
		einfo "Não esqueça de executar o etc-update depois da instalação, ou os mapas do xorg não vão funcionar";
		einfo "Para usar os mapas para o console, use br-nativo, br-internacional, pt-nativo,";
		einfo "     pt-nativo, pt-internacional ou br-dvorak no /etc/conf.d/keymaps";
		einfo "Para saber mais sobre os mapas para o xorg, consulte nosso saite na internete";
		einfo "";
		einfo "";
		einfo "";
	fi
}


