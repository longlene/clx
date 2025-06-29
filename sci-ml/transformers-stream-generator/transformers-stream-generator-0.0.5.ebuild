# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A text generation method which returns a generator, streaming out each token in real-time during inference"
HOMEPAGE="
	https://pypi.org/project/transformers-stream-generator
	https://github.com/LowinLi/transformers-stream-generator
"
SRC_URI="https://github.com/LowinLi/transformers-stream-generator/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-4.26.1[${PYTHON_SINGLE_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

