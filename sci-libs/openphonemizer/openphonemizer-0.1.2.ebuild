# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="An espeak-compatible, permissively-licensed IPA phonemizer based on DeepPhonemizer"
HOMEPAGE="https://github.com/NeuralVox/OpenPhonemizer"
SRC_URI="https://github.com/NeuralVox/OpenPhonemizer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/deep-phonemizer[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/cached-path[${PYTHON_USEDEP}]
		dev-python/num2words[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

S="${WORKDIR}"/OpenPhonemizer-${PV}
