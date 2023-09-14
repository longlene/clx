# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="scikit-learn compatible neural network library"
HOMEPAGE="https://github.com/dnouri/nolearn"
SRC_URI="https://github.com/dnouri/nolearn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy
	dev-python/theano
	dev-python/joblib
	dev-python/tabulate
	sci-libs/scikits_learn
	sci-libs/scipy
"
