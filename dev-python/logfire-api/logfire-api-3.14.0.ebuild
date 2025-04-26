# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

MY_P="logfire-${PV}"

DESCRIPTION="Shim for the Logfire SDK which does nothing unless Logfire is installed"
HOMEPAGE="
	https://pypi.org/project/logfire-api/
	https://github.com/pydantic/logfire
"
SRC_URI="https://github.com/pydantic/logfire/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/${PN}
