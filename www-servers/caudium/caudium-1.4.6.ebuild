# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvsroot/gentoo-x86/net-www/apache/apache-2.0.44.ebuild,v 1.5 2003/02/23 19:39:22 woodchip Exp $

IUSE="perl"

inherit eutils gnuconfig

DESCRIPTION="Caudium Web Server"
HOMEPAGE="http://www.caudium.net/"

CVS_REV=""

MY_P=${P}${CVS_REV}

S="${WORKDIR}/${MY_P}"
SRC_URI="ftp://ftp.caudium.net/caudium/source/${MY_P}.tar.bz2"

LICENSE="GPL-2 | LGPL-2.1 | MPL-1.1"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND=">=dev-lang/pike-7.6.24
	perl?	>=dev-lang/perl-5.8
	dev-libs/expat
	app-text/sablotron
	dev-libs/openssl"

RDEPEND="${DEPEND}"
	
src_compile () 
{
    local myconf
    myconf="${myconf} --with-serverdir=/usr/lib/caudium"
    
    cd ${S}
    
    econf \
	${myconf}
    
    emake || die "Compile error"
  
}

src_install () 
{
    addwrite /usr/bin/pike
    addpredict /usr/bin
    
    emake install_alt prefix=/usr DESTDIR=${D} 
    
    mv ${D}/usr/share/doc/caudium ${D}/usr/share/doc/${P}
    
    newinitd ${FILESDIR}/caudium.rc caudium
    newconfd ${FILESDIR}/caudium.confd caudium
    
    dodir /var/lib/caudium
    fowners www:www /var/lib/caudium
    keepdir /var/run/caudium  
    fowners www:www /var/run/caudium  
    keepdir /var/log/caudium  
    fowners www:www /var/log/caudium  
    keepdir /var/cache/caudium/argument_cache  
    keepdir /var/cache/caudium/storage
    chown -R www:www ${D}/var/cache/caudium

    insinto /etc/caudium/servers
    doins ${FILESDIR}/Global_Variables    
    chown -R www:www ${D}/etc/caudium
}

pkg_preinst() 
{
        enewgroup www 412
	enewuser www 412 -1 /srv/localhost/www www
}

pkg_config ()
{
    cd /usr/lib/caudium
    CAUDIUM_VARDIR=/var/lib/caudium \
    ./install \
	--log-dir=/var/log/caudium \
	--config-dir=/etc/caudium/servers \
	--pid-file=/var/run/caudium/caudium.pid 
}

# Local Variables:
# mode: sh
# End:


