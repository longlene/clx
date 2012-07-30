# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit nsplugins

DESCRIPTION="MolSoft LCC ActiveICM plugin"
SRC_URI="http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=give&platform=linux&ver=1.1-3&mirror=molsoft
-> activeicm-1.1-3.tgz"
HOMEPAGE="http://www.molsoft.com/activeicm.html"
IUSE=""
SLOT="0"

KEYWORDS="-* ~amd64 ~x86"
LICENSE="MolSoft"
RESTRICT="strip mirror"

S=${WORKDIR}

RDEPEND="amd64? ( app-emulation/emul-linux-x86-baselibs
             app-emulation/emul-linux-x86-xlibs )
    x86? ( x11-libs/libXext
        x11-libs/libX11
        x11-libs/libXt )"

pkg_setup() {
    # This is a binary x86 package => ABI=x86
    # Please keep this in future versions
    # Danny van Dyk <kugelfang@gentoo.org> 2005/03/26
    has_multilib_profile && ABI="x86"
}

src_install() {
    cd "${S}/activeicmplugin/"
    exeinto /opt/netscape/plugins
    doexe npicm.so
    inst_plugin /opt/netscape/plugins/npicm.so
}