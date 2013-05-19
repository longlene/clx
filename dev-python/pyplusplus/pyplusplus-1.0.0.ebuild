# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils python

DESCRIPTION="Object-oriented framework for creating a code generator for Boost.Python library"
HOMEPAGE="http://www.language-binding.net/"
SRC_URI="mirror://sourceforge/pygccxml/${P}.zip"

LICENSE="freedist Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND="doc? ( >=dev-python/epydoc-3 )
	app-arch/unzip"
RDEPEND="=dev-python/pygccxml-1.0.0"

S=${WORKDIR}/Py++-${PV}

src_prepare() {
	sed -i -e "s/] + boost.libs/ , boost.libs]/" \
		unittests/autoconfig.py || "patching failed"
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile

	if use doc; then
		"$(PYTHON -f)" setup.py doc || die "docs creation failed"
	fi
}

src_test() {
	testing() {
		mkdir -p unittests/temp
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" unittests/test_all.py
		rm -r unittests/temp || die "removing test directory failed"
	}

	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/documentation/apidocs/* || die
	fi

	if use examples; then
		insinto /usr/share/doc/${PF} || die
		doins -r examples || die
	fi

}
