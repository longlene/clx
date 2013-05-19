# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Pytrainer is a tool to log all your sport excursion."
HOMEPAGE="http://pytrainer.e-oss.net"
SRC_URI="http://www.e-oss.net/descargas/pytrainer/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="mysql"

DEPEND="
	mysql? ( dev-python/mysql-python )
	>=dev-python/pysqlite-2
	>=dev-lang/python-2.4
	>=dev-util/glade-2
	|| (
		<dev-python/matplotlib-0.87
		(
			>=dev-python/matplotlib-0.87
			sci-libs/scipy
			dev-python/numpy
		)
	)

	dev-libs/libxml2
	>=dev-python/pygtk-2.4"

src_install() {
	distutils_src_install
}
