# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

COMMIT="1b4bbf303ec21968230b1ec869a144d054e9b3c4"

DESCRIPTION="Simple, unified interface to multiple Generative AI providers"
HOMEPAGE="https://github.com/andrewyng/aisuite"
SRC_URI="https://github.com/andrewyng/aisuite/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/aisuite-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.0[${PYTHON_USEDEP}]
"
