# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

COMMIT="95c7e5477c2a5bf14301b9a23acfc9d6a0752746"

DESCRIPTION="Making MoE fine-tuning accessible to anyone with consumer hardware"
HOMEPAGE="https://github.com/tsuyu122/usaf"
SRC_URI="https://github.com/tsuyu122/usaf/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/usaf-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.40[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
	')
"
