# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="88eb3f53166436fbeb09b41387be1c13971f9743"

DESCRIPTION="Speed-of-light MLA kernels for Blackwell SM100 and SM103"
HOMEPAGE="https://github.com/lightseekorg/tokenspeed"
SRC_URI="https://github.com/lightseekorg/tokenspeed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/tokenspeed-${EGIT_COMMIT}/tokenspeed-mla"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/tvm-ffi-0.1.5[${PYTHON_USEDEP}]
		dev-python/nvidia-cutlass-dsl[${PYTHON_USEDEP}]
		sci-ml/tokenspeed-triton[${PYTHON_USEDEP}]
	')
"
