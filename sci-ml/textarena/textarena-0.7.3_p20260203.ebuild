# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="a2c896c5c84c8557d78d3d9182a066ff573daf44"

DESCRIPTION="A Collection of Competitive Text-Based Games for Language Model Evaluation"
HOMEPAGE="
	https://pypi.org/project/textarena/
	https://github.com/TextArena/TextArena
"
SRC_URI="https://github.com/TextArena/TextArena/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/TextArena-${EGIT_COMMIT}
KEYWORDS="~amd64"

RDEPEND="
	dev-python/openai[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/chess[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
