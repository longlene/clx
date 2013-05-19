# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

DESCRIPTION="Python implementation of the Flickr API."
HOMEPAGE="http://flickrapi.sourceforge.net/"
SRC_URI="http://dl.sourceforge.net/sourceforge/flickrapi/${P}.tar.gz"
LICENSE="PSF-2.4"

SLOT="0"
KEYWORDS="~x86"
IUSE="test"

DEPEND="dev-python/setuptools
	dev-python/docutils
	test? ( dev-python/nose )"
RDEPEND=""

src_compile() {
	addpredict "/root/.gconfd"
	addpredict "/root/.gconf"

	distutils_src_compile
}

src_test() {
	einfo "Running nosetests"
	nosetests || die "tests failed"
}