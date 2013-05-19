# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Concurrence is a framework for creating massively concurrent network applications in Python"
HOMEPAGE="http://opensource.hyves.org/concurrence"
SRC_URI="http://concurrence.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc examples"

DEPEND=">=dev-lang/python-2.5
	dev-python/setuptools"
RDEPEND="${DEPEND}"


src_install() {
	distutils_src_install

	if use doc; then
		dodoc doc/*
	fi

	if use examples; then
		docinto examples
		dodoc /examples/* || die "dodoc failed"
	fi
}

src_test() {
	PYTHONPATH="build/lib" "${python}" setup.py test || die "Tests failed"
}

