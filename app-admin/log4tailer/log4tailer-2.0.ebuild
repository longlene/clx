# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Log4tailer is a python tailer with advanced features"
HOMEPAGE="http://code.google.com/p/log4tailer/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/pymox
		dev-python/paramiko )"
RDEPEND="virtual/python"

src_test() {
	PYTHONPATH=. "${python}" setup.py test || die "tests failed"
}

src_install() {
	distutils_src_install

	insinto /etc
	newins log4tailerconfig.txt log4tailer.conf || die "newins failed"
}
