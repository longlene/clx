# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Prime Intellect CLI + SDK"
HOMEPAGE="
	https://pypi.org/project/prime/
	https://github.com/PrimeIntellect-ai/prime
"
SRC_URI="https://github.com/PrimeIntellect-ai/prime/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${S}"/packages/${PN}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/verifiers-0.1.14[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/prime-sandboxes-0.2.23[${PYTHON_USEDEP}]
		>=dev-python/prime-evals-0.1.3[${PYTHON_USEDEP}]
		>=dev-python/prime-tunnel-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.3.1[${PYTHON_USEDEP}]
		>=dev-python/textual-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/textual-plot-0.10.1[${PYTHON_USEDEP}]
		>=dev-python/cryptography-41.0.0[${PYTHON_USEDEP}]
		>=dev-python/build-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/gitignore-parser-0.1.13[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/toml-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/tomli-2.0.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
