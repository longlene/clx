# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_DEPEND="2:2.5"

inherit distutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Web application testing toolkit."
HOMEPAGE="http://www.getwindmill.com/"
SRC_URI="http://cheeseshop.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="ssl"

RDEPEND="
	dev-python/setuptools"

DEPEND="
	>=dev-python/simplejson-1.7.1
	ssl? ( dev-python/pyopenssl )"

src_install() {
	distutils_src_install
}

