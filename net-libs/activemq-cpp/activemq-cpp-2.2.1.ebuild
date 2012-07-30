# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/webkit-gtk/webkit-gtk-0_p40220.ebuild,v 1.2 2009/01/31 21:51:04 jokey Exp $

inherit autotools

DESCRIPTION="C++ Messaging Service is a JMS-like API for C++"
HOMEPAGE="http://activemq.apache.org/cms/"
SRC_URI="http://www.sai.msu.su/apache/activemq/activemq-cpp/source/${P}-src.tar.gz"

RDEPEND="dev-libs/apr 
	dev-libs/apr-util"

DEPEND="${RDEPEND}"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_compile() {
	./autogen.sh
	econf
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

