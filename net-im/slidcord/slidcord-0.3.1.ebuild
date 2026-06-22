# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A Discord/XMPP gateway"
HOMEPAGE="https://codeberg.org/slidge/slidcord https://pypi.org/project/slidcord/"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# discord-py-self and slidge are not yet packaged in portage
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/emoji-2.8.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"
