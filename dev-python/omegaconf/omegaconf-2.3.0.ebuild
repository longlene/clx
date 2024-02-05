# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Flexible Python configuration system"
HOMEPAGE="https://github.com/omry/omegaconf"
SRC_URI="https://github.com/omry/omegaconf/archive/refs/tags/v${PV}.tar.gz -> ${PV}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-5.1.0[${PYTHON_USEDEP}]
	dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
