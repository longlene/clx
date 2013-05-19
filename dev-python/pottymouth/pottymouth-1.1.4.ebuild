# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

MY_PN="PottyMouth"
DESCRIPTION="A python library that scrubs untrusted text to valid, nice-looking, completely safe XHTML"
HOMEPAGE="http://devsuki.com/pottymouth/"
SRC_URI="http://devsuki.com/pottymouth/dist/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"

S="${WORKDIR}/${MY_PN}-${PV}"

src_test() {
	python setup.py test || die "Tests failed"
}
