# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A small and easy workflow system"
HOMEPAGE="
	https://pypi.org/project/weasel/
	https://github.com/explosion/weasel
"
SRC_URI="https://github.com/explosion/weasel/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/confection-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/wasabi-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.3[${PYTHON_USEDEP}]
	>=dev-python/typer-slim-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/cloudpathlib-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/smart-open-5.2.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-release-v${PV}
