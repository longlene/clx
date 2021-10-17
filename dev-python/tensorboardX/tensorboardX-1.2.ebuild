# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="TensorBoardX lets you watch Tensors Flow without Tensorflow"
HOMEPAGE="https://github.com/lanpa/tensorboard-pytorch"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy
	dev-python/protobuf
	dev-python/six
"
