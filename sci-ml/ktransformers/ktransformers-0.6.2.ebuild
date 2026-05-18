# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Flexible Framework for Experiencing Heterogeneous LLM Inference/Fine-tune Optimizations"
HOMEPAGE="
	https://pypi.org/project/ktransformers/
	https://github.com/kvcache-ai/ktransformers/
"
SRC_URI="https://github.com/kvcache-ai/ktransformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/kt-kernel-${PV}[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
