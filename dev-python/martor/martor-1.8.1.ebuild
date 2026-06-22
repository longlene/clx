# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Django Markdown Editor"
HOMEPAGE="https://github.com/agusmakmun/django-markdown-editor https://pypi.org/project/martor/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/django-3.2[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.12.4[${PYTHON_USEDEP}]
		dev-python/bleach[${PYTHON_USEDEP}]
		dev-python/tzdata[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/zipp[${PYTHON_USEDEP}]
	')
"
