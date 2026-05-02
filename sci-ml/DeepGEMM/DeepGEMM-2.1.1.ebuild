# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="DeepGEMM: clean and efficient FP8 GEMM kernels with fine-grained scaling"
HOMEPAGE="
	https://pypi.org/project/DeepGEMM
	https://github.com/deepseek-ai/DeepGEMM/
"
SRC_URI="https://github.com/deepseek-ai/DeepGEMM/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/cutlass
	dev-libs/libfmt
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/system-cutlass.patch
)
