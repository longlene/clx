# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Open Source Neural Machine Translation in PyTorch"
HOMEPAGE="https://opennmt.net/"
SRC_URI="https://github.com/OpenNMT/OpenNMT-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/pytorch-1.12.1[${PYTHON_USEDEP}]
	dev-python/configargparse[${PYTHON_USEDEP}]
	>=sci-ml/ctranslate2-3.2
	>=dev-python/tensorboard-2.3[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/waitress[${PYTHON_USEDEP}]
	>=dev-python/pyonmttok-1.35[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/sacrebleu[${PYTHON_USEDEP}]
"
BDEPEND=""
