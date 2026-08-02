# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="DuckDB in-process analytical SQL database"
HOMEPAGE="https://github.com/duckdb/duckdb-python"
SRC_URI="
	https://github.com/duckdb/duckdb-python/archive/refs/tags/v${PV}.tar.gz -> ${PN}-python-${PV}.gh.tar.gz
	https://github.com/duckdb/duckdb/archive/refs/tags/v${PV}.tar.gz -> duckdb-${PV}.tar.gz
"

S="${WORKDIR}/duckdb-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	>=dev-python/scikit-build-core-0.11.4[${PYTHON_USEDEP}]
	>=dev-python/pybind11-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-8.0[${PYTHON_USEDEP}]
"

src_prepare() {
	# Populate the bundled duckdb C++ submodule from the separate archive
	rm -rf "${S}/external/duckdb" || die
	mv "${WORKDIR}/duckdb-${PV}" "${S}/external/duckdb" || die

	# Replace custom build backend wrapper with scikit-build-core directly,
	# keeping backend-path so duckdb_packaging version scheme stays importable
	sed -i \
		-e 's|build-backend = "duckdb_packaging.build_backend"|build-backend = "scikit_build_core.build"|' \
		pyproject.toml || die

	distutils-r1_src_prepare
}

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_DUCKDB="${PV}" distutils-r1_python_compile
}
