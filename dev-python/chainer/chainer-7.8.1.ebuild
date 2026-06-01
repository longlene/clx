# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14}  )
inherit distutils-r1

DESCRIPTION="A flexible framework of neural networks for deep learning"
HOMEPAGE="
	https://chainer.org
	https://github.com/chainer/chainer/tags
"
SRC_URI="https://github.com/chainer/chainer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
