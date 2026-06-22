# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Log and progress bar manager for console, notebooks, web"
HOMEPAGE="https://pypi.org/project/proglog/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	dev-python/tqdm[${PYTHON_USEDEP}]
')"
