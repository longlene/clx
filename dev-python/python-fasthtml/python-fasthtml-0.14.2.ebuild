# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The fastest way to create an HTML app"
HOMEPAGE="https://www.fastht.ml/ https://github.com/AnswerDotAI/fasthtml"
SRC_URI="https://github.com/AnswerDotAI/fasthtml/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/fasthtml-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# dev-python/fastcore and dev-python/fastlite are not yet packaged in portage.

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/beautifulsoup4-4.12[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/oauthlib[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30[${PYTHON_USEDEP}]
	')
"
