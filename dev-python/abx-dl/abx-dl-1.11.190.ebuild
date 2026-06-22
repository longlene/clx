# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="CLI tool to download and extract content from URLs"
HOMEPAGE="https://github.com/ArchiveBox/abx-dl https://pypi.org/project/abx-dl/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/rich-click[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		~dev-python/abxbus-2.5.10[${PYTHON_USEDEP}]
		>=dev-python/abxpkg-1.11.186[${PYTHON_USEDEP}]
		>=dev-python/abx-plugins-1.11.190[${PYTHON_USEDEP}]
		>=dev-python/jambo-0.1.7[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.2.1[${PYTHON_USEDEP}]
	')
"
