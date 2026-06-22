# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="ATIF schema models for NVIDIA NeMo Agent Toolkit"
HOMEPAGE="https://docs.nvidia.com/nemo/agent-toolkit/latest/ https://github.com/NVIDIA/NeMo-Agent-Toolkit"
SRC_URI="https://github.com/NVIDIA/NeMo-Agent-Toolkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/NeMo-Agent-Toolkit-${PV}/packages/nvidia_nat_atif"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="full"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
	full? ( >=dev-python/jsonschema-4.0[${PYTHON_USEDEP}] )
')"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"

python_prepare_all() {
	# setuptools_dynamic_dependencies is not packaged; make deps static instead
	# Also relax upstream's conservative <3.14 upper bound
	sed -i \
		-e 's|"setuptools_dynamic_dependencies>=1.0.0", ||' \
		-e 's|dynamic = \["version", "dependencies", "optional-dependencies"\]|dynamic = ["version"]|' \
		-e 's|requires-python = ">=3.11,<3.14"|requires-python = ">=3.11"|' \
		pyproject.toml || die
	# Insert static runtime dep after requires-python line
	sed -i '/^requires-python/a dependencies = ["pydantic>=2.11"]' pyproject.toml || die
	distutils-r1_python_prepare_all
}

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION="${PV}" distutils-r1_python_compile
}
