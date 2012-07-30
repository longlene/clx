# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-ldap/python-ldap-2.3.1.ebuild,v 1.1 2007/08/15 11:12:27 dev-zero Exp $

NEED_PYTHON=2.4

inherit distutils multilib

DESCRIPTION="n implementation of a radix tree data structure for the storage 
and retrieval of IPv4 and IPv6 network prefixes"
SRC_URI="http://www.mindrot.org/files/py-radix/${P}.tar.gz"
HOMEPAGE="http://www.mindrot.org/projects/py-radix/"
SLOT="0"
KEYWORDS="~x86"

src_install() {
	distutils_src_install
}
