# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="LlamaIndex is a data framework for your LLM applications"
HOMEPAGE="https://github.com/run-llama/llama_index"
SRC_URI="https://github.com/run-llama/llama_index/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

S="${WORKDIR}"/llama_index-${PV}
