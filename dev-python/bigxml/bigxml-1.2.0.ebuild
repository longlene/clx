# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Parse big XML files and streams with ease"
HOMEPAGE="https://bigxml.rogdham.net/ https://github.com/Rogdham/bigxml"
SRC_URI="https://github.com/Rogdham/bigxml/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-vcs[${PYTHON_USEDEP}]
	')
"
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	')
"

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
