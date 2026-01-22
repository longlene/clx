# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Minimalistic large language model 3D-parallelism training"
HOMEPAGE="https://github.com/huggingface/nanotron"
SRC_URI="https://github.com/huggingface/nanotron/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.13.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/dacite[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)
