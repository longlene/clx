# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Extensions to YAML syntax for better python interaction"
HOMEPAGE="https://github.com/speechbrain/HyperPyYAML"
SRC_URI="https://github.com/speechbrain/HyperPyYAML/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.28[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/HyperPyYAML-${PV}
