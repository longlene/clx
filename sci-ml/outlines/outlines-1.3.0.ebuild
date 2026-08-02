# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Structured Text Generation"
HOMEPAGE="
	https://github.com/dottxt-ai/outlines
"
SRC_URI="https://github.com/dottxt-ai/outlines/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="airports countries"

RDEPEND="
	>=sci-ml/outlines-core-0.2.14[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/diskcache[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/genson[${PYTHON_USEDEP}]
		dev-python/jsonpath-ng[${PYTHON_USEDEP}]
		airports? ( dev-python/airportsdata[${PYTHON_USEDEP}] )
		countries? ( dev-python/iso3166[${PYTHON_USEDEP}] )
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"

python_configure_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}

distutils_enable_tests pytest
