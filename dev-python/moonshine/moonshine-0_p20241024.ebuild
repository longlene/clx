# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

EGIT_COMMIT="88230f0a5b74c93f20811d7e14a032dd411dad2e"

DESCRIPTION="Fast and accurate automatic speech recognition"
HOMEPAGE="https://github.com/usefulsensors/moonshine
	https://pypi.org/project/moonshine/
"
SRC_URI="https://github.com/usefulsensors/moonshine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numba[${PYTHON_USEDEP}]
	>=dev-python/tokenizers-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/einops-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/librosa-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/keras-3.6.0[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-2.4.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
