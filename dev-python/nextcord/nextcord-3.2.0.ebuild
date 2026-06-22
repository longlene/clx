# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="A Python wrapper for the Discord API forked from discord.py"
HOMEPAGE="https://docs.nextcord.dev https://github.com/nextcord/nextcord"
SRC_URI="https://github.com/nextcord/nextcord/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="speed voice"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
		speed? (
			dev-python/aiodns[${PYTHON_USEDEP}]
			app-arch/brotli[python,${PYTHON_USEDEP}]
		)
		voice? ( >=dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	')
	$(python_gen_cond_dep '
		>=dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]
	' python3_13 python3_14)
"

python_prepare_all() {
	sed -i \
		-e 's/^version = "0\.0\.0"/version = "'"${PV}"'"/' \
		-e 's|build-backend = "poetry_dynamic_versioning\.backend"|build-backend = "poetry.core.masonry.api"|' \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}
