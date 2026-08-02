# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Extending constructor of PyYAML to include other YAML files"
HOMEPAGE="https://github.com/tanbro/pyyaml-include https://pypi.org/project/pyyaml-include/"
SRC_URI="https://github.com/tanbro/pyyaml-include/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	dev-python/fsspec[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/setuptools-scm
"

distutils_enable_tests pytest

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
