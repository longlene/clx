# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Generates Pydantic v2 models from JSON Schema definitions"
HOMEPAGE="https://github.com/richard-gyiko/json-schema-to-pydantic"
SRC_URI="https://github.com/richard-gyiko/json-schema-to-pydantic/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/pydantic-2.10.4[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

python_prepare_all() {
	# hatch-vcs falls back to 0.0.0 without git; set the correct version
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_python_prepare_all
}

python_compile() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_python_compile
}
