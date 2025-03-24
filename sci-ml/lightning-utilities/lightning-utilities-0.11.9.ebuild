# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Common Python utilities and GitHub Actions in Lightning Ecosystem"
HOMEPAGE="https://github.com/Lightning-AI/utilities"
SRC_URI="https://github.com/Lightning-AI/utilities/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/packaging-17.1[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
distutils_enable_tests pytest

S="${WORKDIR}"/utilities-${PV}
