# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="FastAPI framework, high performance, easy to learn, fast to code, ready for production"
HOMEPAGE="
	https://github.com/fastapi/fastapi
	https://fastapi.tiangolo.com/
"
SRC_URI="https://github.com/fastapi/fastapi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/starlette-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/annotated-doc-0.0.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
