# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="TensorBoardX lets you watch Tensors Flow without Tensorflow"
HOMEPAGE="https://github.com/lanpa/tensorboardX"
SRC_URI="https://github.com/lanpa/tensorboardX/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
