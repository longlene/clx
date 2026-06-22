# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Open source bridge software that connects XMPP and IRC channels"
HOMEPAGE="https://telepath.im/projects/j2i/ https://pypi.org/project/j2i/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/slixmpp-1.8.0[${PYTHON_USEDEP}]
	')
"
