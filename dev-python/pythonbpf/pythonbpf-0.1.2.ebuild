# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python Frontend to LLVM IR for eBPF programs in Pure Python"
HOMEPAGE="
	https://pypi.org/project/pythonbpf/
	https://github.com/varun-r-mallya/Python-BPF
"
SRC_URI="https://github.com/varun-r-mallya/Python-BPF/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/llvmlite[${PYTHON_USEDEP}]
	dev-python/astpretty[${PYTHON_USEDEP}]
	dev-python/pylibbpf[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/Python-BPF-${PV}
