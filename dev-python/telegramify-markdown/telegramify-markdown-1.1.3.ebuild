# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Convert Markdown to Telegram plain text + MessageEntity pairs"
HOMEPAGE="
	https://pypi.org/project/telegramify-markdown/
	https://github.com/sudoskys/telegramify-markdown
"
SRC_URI="https://github.com/sudoskys/telegramify-markdown/archive/refs/tags/pypi_${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyromark-0.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/telegramify-markdown-pypi_${PV}
