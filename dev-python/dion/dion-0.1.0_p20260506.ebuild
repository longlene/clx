# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="4dc5728fb7e605b658ac44e0720ee87fe25b806f"

DESCRIPTION="Dion optimizer algorithm"
HOMEPAGE="
	https://pypi.org/project/dion/
	https://github.com/microsoft/dion
"
SRC_URI="https://github.com/microsoft/dion/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.7.1[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gram-newton-schulz-0.1.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/quack-kernels-0.4.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
