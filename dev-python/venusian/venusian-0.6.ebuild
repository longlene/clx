# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A library for deferring decorator actions"
HOMEPAGE="http://www.repoze.org"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND=""

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" setup.py "test"
	}
	python_execute_function testing
}

src_compile() {
	distutils_src_compile
	if use doc ; then
		emake -C docs html || die "make html failed"
	fi
}

src_install() {
	distutils_src_install

	if use doc ; then
		dohtml -r docs/.build/html/* || die "dohtml failed"
	fi
}
