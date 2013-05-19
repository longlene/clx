# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1

DESCRIPTION="Metrics Logging"
HOMEPAGE="https://github.com/mozilla-services/metlog-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/docopt-0.5[${PYTHON_USEDEP}]
		 dev-python/pyzmq"
DEPEND="${RDEPEND}
		test? (
			dev-python/mock[${PYTHON_USEDEP}]
			dev-python/nose[${PYTHON_USEDEP}]
		)
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die "Tests fail with ${PYTHON}"
}
