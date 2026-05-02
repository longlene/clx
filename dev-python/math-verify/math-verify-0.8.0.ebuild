# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="HuggingFace library for verifying mathematical answers"
HOMEPAGE="
	https://pypi.org/project/math-verify/
	https://github.com/huggingface/math-verify
"
SRC_URI="https://github.com/huggingface/Math-Verify/archive/refs/tags/0.8.0.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/latex2sympy2-extended-1.11.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/Math-Verify-${PV}
