# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="The official Python client for Ollama"
HOMEPAGE="
	https://pypi.org/project/ollama/
	https://ollama.com
"
SRC_URI="https://github.com/ollama/ollama-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/ollama-python-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
