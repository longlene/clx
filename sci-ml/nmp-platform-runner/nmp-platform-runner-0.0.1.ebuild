# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="Platform runner library for NeMo Platform services"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> nemo-platform-0.1.3_rc0.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}/packages/nmp_platform_runner"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.115.4[${PYTHON_USEDEP}]
		>=dev-python/pyleak-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/rich-14.1.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.12.0[${PYTHON_USEDEP}]
		sci-ml/nemo-platform-plugin[${PYTHON_USEDEP}]
	')
	sci-ml/nmp-common[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND=""
RESTRICT="test"
