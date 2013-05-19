# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1

MY_PN="WSGIProxy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="HTTP proxying tools for WSGI apps"
HOMEPAGE="http://pypi.python.org/pypi/WSGIProxy"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/paste"

S="${WORKDIR}/${MY_P}"
