# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Minimalist self-evolving autonomous agent framework"
HOMEPAGE="https://github.com/lsdefine/GenericAgent"
SRC_URI="https://github.com/lsdefine/GenericAgent/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/GenericAgent-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bot ui"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/requests-2.28[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12[${PYTHON_USEDEP}]
		>=dev-python/bottle-0.12[${PYTHON_USEDEP}]
		ui? (
			>=dev-python/streamlit-1.28[${PYTHON_USEDEP}]
			dev-python/pywebview[${PYTHON_USEDEP}]
		)
		bot? (
			>=dev-python/python-telegram-bot-20.0[${PYTHON_USEDEP}]
		)
	')
"
DEPEND="${RDEPEND}"
