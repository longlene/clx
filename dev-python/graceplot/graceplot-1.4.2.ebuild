# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/irman-python/irman-python-0.1.ebuild,v 1.15 2005/10/02 14:10:17 agriffis Exp $

inherit distutils

IUSE=""
DESCRIPTION="A plotting library for using grace from python."
HOMEPAGE="http://graceplot.sourceforge.net"
SRC_URI="mirror://sourceforge/graceplot/${PN}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 sparc x86"

DEPEND="virtual/python \
	dev-python/numeric \
	sci-visualization/grace"

src_compile(){
        return
}

src_install() {
	cd ${P}/work
	mkdir -p ${D}/usr/lib/python2.4/site-packages/GracePlot
	mkdir -p ${D}/usr/share/doc/${P}/examples
	cp grace_example.py ${D}/usr/share/doc/${P}/examples
	cp grace_example2.py ${D}/usr/share/doc/${P}/examples
	cp grace_example3.py ${D}/usr/share/doc/${P}/examples
	cp GracePlot.py ${D}/usr/lib/python2.4/site-packages/GracePlot
	cp __init__.py ${D}/usr/lib/python2.4/site-packages/GracePlot
	cp grace_np.py ${D}/usr/lib/python2.4/site-packages/GracePlot
}
