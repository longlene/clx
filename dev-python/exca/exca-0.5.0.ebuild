# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Execution and caching tool for Python"
HOMEPAGE="https://github.com/facebookresearch/exca"
SRC_URI="https://github.com/facebookresearch/exca/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.19[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/submitit-1.5.1[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

src_prepare() {
	cat >> pyproject.toml <<-'EOF'

	[build-system]
	requires = ["setuptools>=61.0"]
	build-backend = "setuptools.build_meta"
	EOF
	distutils-r1_src_prepare
}
