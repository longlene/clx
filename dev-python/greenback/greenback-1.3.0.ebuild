# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Reenter an asyncio or Trio event loop from synchronous code"
HOMEPAGE="https://github.com/oremanj/greenback https://greenback.readthedocs.io/"
SRC_URI="https://github.com/oremanj/greenback/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/greenlet[${PYTHON_USEDEP}]
		dev-python/outcome[${PYTHON_USEDEP}]
		dev-python/sniffio[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
