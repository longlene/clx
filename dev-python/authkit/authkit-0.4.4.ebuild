# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/beaker/beaker-1.2.2.ebuild,v 1.1 2009/04/26 08:56:16 patrick Exp $

NEED_PYTHON=2.4

inherit distutils

MY_PN=AuthKit
MY_P=${MY_PN}-${PV}

DESCRIPTION="An authentication and authorization toolkit for WSGI"
HOMEPAGE="http://authkit.org/"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S=${WORKDIR}/${MY_P}
