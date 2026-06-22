# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Blazingly fast DataFrame library"
HOMEPAGE="
	https://www.pola.rs/
	https://github.com/pola-rs/polars
	https://pypi.org/project/polars/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="numpy pandas pyarrow pydantic"
# Tests require the polars-runtime-* Rust extension which is not yet packaged
RESTRICT="test"

# polars-runtime-{32,64,compat} provide the compiled Rust extension (_polars_runtime)
# TODO: package dev-python/polars-runtime-64 or dev-python/polars-runtime-compat
#RDEPEND="|| ( dev-python/polars-runtime-64[${PYTHON_USEDEP}] dev-python/polars-runtime-compat[${PYTHON_USEDEP}] )"
RDEPEND="
	$(python_gen_cond_dep '
		numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
		pandas? (
			dev-python/pandas[${PYTHON_USEDEP}]
			dev-python/pyarrow[${PYTHON_USEDEP}]
		)
		pyarrow? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
		pydantic? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	')
"
