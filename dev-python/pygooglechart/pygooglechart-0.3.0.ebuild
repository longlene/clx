# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A complete Python wrapper for the Google Chart API"
HOMEPAGE="http://pygooglechart.slowchop.com/"
SRC_URI="http://pygooglechart.slowchop.com/files/download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( dev-python/PyQrcodec )"
RDEPEND=""

PYTHON_MODNAME="${PN}.py"

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" test/test_general.py && \
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" test/test_bugs.py
	}
	touch test/__init__.py
	python_execute_function testing
}
