# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="ArchiveBox-compatible plugin suite with hooks, configs, binary manifests"
HOMEPAGE="https://github.com/ArchiveBox/abx-plugins https://pypi.org/project/abx-plugins/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

python_prepare_all() {
	# upstream incorrectly includes README.md/LICENSE/pyproject.toml in wheel
	sed -i '/tool.hatch.build.targets.wheel/,/^\[/{/README\.md\|LICENSE\|pyproject\.toml/d}' \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}

RDEPEND="
	dev-python/uv
	$(python_gen_cond_dep '
		~dev-python/abxbus-2.5.10[${PYTHON_USEDEP}]
		>=dev-python/abxpkg-1.11.186[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/jambo[${PYTHON_USEDEP}]
		dev-python/rich-click[${PYTHON_USEDEP}]
	')
"
