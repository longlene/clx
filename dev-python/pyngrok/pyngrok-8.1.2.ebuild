# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for ngrok"
HOMEPAGE="https://github.com/alexdlaird/pyngrok https://pypi.org/project/pyngrok/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
')"

src_prepare() {
	# pyproject.toml lacks [build-system]; inject it so distutils-r1 can proceed.
	cat >> pyproject.toml <<-EOF

	[build-system]
	requires = ["setuptools", "wheel"]
	build-backend = "setuptools.build_meta"
	EOF
	distutils-r1_src_prepare
}
