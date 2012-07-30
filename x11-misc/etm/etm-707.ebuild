# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/etm/etm-696.ebuild,v 1.1 2011/01/19 03:45:52 lack Exp $

EAPI=3
PYTHON_DEPEND="2:2.5"
inherit distutils eutils

DESCRIPTION="Event and Task Manager, an intuitive time management application"
HOMEPAGE="http://www.duke.edu/~dgraham/ETM/"
SRC_URI="http://www.duke.edu/~dgraham/ETM/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ical"

DEPEND="dev-python/wxpython:2.8
	dev-python/python-dateutil
	ical? ( dev-python/icalendar )"
RDEPEND="${DEPEND}"
RESTRICT_PYTHON_ABIS="2.4 3.*"

src_install() {
	distutils_src_install
	make_desktop_entry /usr/bin/e.pyw "ETM" /usr/lib/python2.6/site-packages/etm/etmlogo_32x32x32.png "Office;Calendar"
}
