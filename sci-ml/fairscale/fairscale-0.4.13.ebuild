# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="PyTorch extensions for high performance and large scale training"
HOMEPAGE="https://github.com/facebookresearch/fairscale https://pypi.org/project/fairscale/"
SRC_URI="https://github.com/facebookresearch/fairscale/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=sci-ml/pytorch-1.8.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

python_install() {
	distutils-r1_python_install
	rm -r "${D}$(python_get_sitedir)/benchmarks" || die
}
