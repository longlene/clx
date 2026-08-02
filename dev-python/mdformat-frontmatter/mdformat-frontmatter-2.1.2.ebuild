# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="mdformat plugin to ensure YAML front matter is respected"
HOMEPAGE="https://github.com/butler54/mdformat-frontmatter"
SRC_URI="https://github.com/butler54/mdformat-frontmatter/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/mdformat-0.7.16[${PYTHON_USEDEP}]
	>=dev-python/mdit-py-plugins-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.15[${PYTHON_USEDEP}]
"
