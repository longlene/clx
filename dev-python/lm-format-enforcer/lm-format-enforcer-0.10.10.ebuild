# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Enforce the output format (JSON Schema, Regex etc) of a language model"
HOMEPAGE="
	https://pypi.org/project/lm-format-enforcer/
	https://github.com/noamgat/lm-format-enforcer
"
SRC_URI="https://github.com/noamgat/lm-format-enforcer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	>=dev-python/interegular-0.3.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
