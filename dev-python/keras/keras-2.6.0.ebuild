# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 )
inherit distutils-r1

DESCRIPTION="Deep Learning library for Python"
HOMEPAGE="http://keras.io/"
SRC_URI="https://github.com/fchollet/keras/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/theano
	dev-python/pyyaml
	dev-python/six
	dev-python/h5py
	dev-python/pydot
"
