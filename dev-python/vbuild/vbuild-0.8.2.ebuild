# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="A simple module to extract html/script/style from a vuejs '.vue' file"
HOMEPAGE="https://github.com/manatlan/vbuild"
SRC_URI="https://github.com/manatlan/vbuild/archive/refs/tags/v0.8.2.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pscript-0.7.7[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
