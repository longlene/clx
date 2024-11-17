# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="ee54db5bcb25544adddf63cf83a5b42d195c7905"

DESCRIPTION="Effortlessly spice up your terminal apps using colors, progressbars & more"
HOMEPAGE="https://gitlab.com/Vivern/revel"
SRC_URI="https://gitlab.com/mad-moo/revel/-/archive/${EGIT_COMMIT}/revel-${EGIT_COMMIT}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/blessed-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/readchar-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
