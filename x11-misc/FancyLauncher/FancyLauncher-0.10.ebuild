# Copyright 1999-2005 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 
# $Header: $

DESCRIPTION="A a very configurable program launcher with extra features"
SRC_URI="http://user.it.uu.se/~adavid/utils/FancyLauncher-${PV}.tgz"

HOMEPAGE="http://user.it.uu.se/~adavid/utils/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="virtual/x11
         media-libs/imlib"
DEPEND="${RDEPEND}"

src_compile() {
    for i in EF2F.c Makefile load_save.c help.html data/config\
	plugins/xscreensaver/init plugins/xscreensaver/lock plugins/xscreensaver/switch; do
      mv ${i} ${i}.old
      sed -r "s#(.*)/usr/local/(.*)#\1/usr/share/\2#g" ${i}.old >${i}
      rm ${i}.old
    done
    make "CFLAGS=${CFLAGS} -DDEBUG=0" 
    make "CFLAGS=${CFLAGS} -DDEBUG=0"
}

src_install () {
    dodir /usr/bin
    dodir /usr/share/FancyLauncher
    dobin FancyLauncher EF2F
    dodoc Changelog
    
    insinto /usr/share/FancyLauncher
    doins FancyLauncher.gif help.html data/config
    
    for i in data snapshots plugins/icons; do
	insinto /usr/share/FancyLauncher/${i}
	doins ${i}/*
    done
    
    insinto /usr/share/FancyLauncher/plugins
    doins plugins/README plugins/plugins.cfg
    
    insopts '-m0755'
    for i in keyboard_mapper mounter xscreensaver; do
	insinto /usr/share/FancyLauncher/plugins/${i}
	doins plugins/${i}/*
    done
}
