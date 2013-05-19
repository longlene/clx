# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="repoze.what-pylons"
MY_P="${MY_PN/e-w/e.e}-${PV}"

DESCRIPTION="Automatically manage database schema version control when using SQLAlchemy"
HOMEPAGE="http://what.repoze.org/docs/1.0/"
SRC_URI="http://pypi.python.org/packages/source/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/nose )"
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" LC_ALL="C" nosetests-${PYTHON_ABI}
	}
	python_execute_function testing
}
