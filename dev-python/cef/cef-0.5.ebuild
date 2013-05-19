# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python{2_6,2_7} pypy{1_9,2_0})

inherit distutils-r1

DESCRIPTION="Module that emits CEF logs"
HOMEPAGE="http://pypi.python.org/pypi/cef"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" "test_${PN}.py" || die "Tests fail with ${PYTHON}"
}
