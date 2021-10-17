# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Face recognition with deep neural networks"
HOMEPAGE="http://cmusatyalab.github.io/openface/"
SRC_URI="https://github.com/cmusatyalab/openface/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy
	dev-python/pandas
	dev-python/nose
	dev-python/nolearn
	sci-libs/scipy
	sci-libs/scikits_learn
"
