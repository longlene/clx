# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="identification and authentication framework for WSGI."
HOMEPAGE="http://pypi.python.org/pypi/repoze.who"
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

S=${WORKDIR}/${MY_P}

RDEPEND="dev-python/paste
		 net-zope/zope-interface"
DEPEND="${RDEPEND}
		test? ( dev-python/nose[${PYTHON_USEDEP}] )
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
		nosetests || die "Tests fail with ${EPYTHON}"
}
