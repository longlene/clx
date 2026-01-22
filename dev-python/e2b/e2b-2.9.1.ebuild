# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="E2B SDK that give agents cloud environments"
HOMEPAGE="
	https://pypi.org/project/e2b/
	https://github.com/e2b-dev/E2B
"
SRC_URI="https://github.com/e2b-dev/E2B/archive/refs/tags/@e2b/python-sdk@${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/wcmatch-10.1[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
	>=dev-python/httpcore-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-23.2.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/dockerfile-parse-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/E2B--e2b-python-sdk-${PV}/packages/python-sdk
