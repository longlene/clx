# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils python

DESCRIPTION="Generate an XML description of a C++ program from GCC's internal representation"
HOMEPAGE="http://www.language-binding.net/"
SRC_URI="mirror://sourceforge/pygccxml/${P}.zip"

LICENSE="freedist Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND="doc? ( >=dev-python/epydoc-3 )
	app-arch/unzip"
RDEPEND=">=dev-cpp/gccxml-0.6"

src_compile() {
	distutils_src_compile

	if use doc; then
		"$(PYTHON -f)" setup.py doc || die "creation of docs failed"
	fi
}

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" unittests/test_all.py
	}

	python_execute_function testing
}

src_install() {
	distutils_src_install
	
	if use doc; then
		dohtml -r docs/apidocs/* || die "creation of docs failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF} || die
		doins -r docs/example || die
	fi
}
