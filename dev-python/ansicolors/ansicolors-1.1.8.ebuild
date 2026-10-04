# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

# No pyproject.toml; pin the backend before inherit (distutils-r1 generates
# BDEPEND at inherit time and dies on an empty DISTUTILS_USE_PEP517).
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Ansi colored strings for terminal output"
HOMEPAGE="
	https://pypi.org/project/ansicolors/
"
# Legacy-layout PyPI sdist (a .zip); the pypi eclass's URL helper only
# generates the obsolete tar.gz path, so pin the real file.
SRC_URI="https://files.pythonhosted.org/packages/76/31/7faed52088732704523c259e24c26ce6f2f33fbeff2ff59274560c27628e/${P}.zip"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

distutils_enable_tests pytest
