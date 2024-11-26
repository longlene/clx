# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A pytablewriter plugin to provide a theme that colored rows alternatively"
HOMEPAGE="https://github.com/thombashi/pytablewriter-altrow-theme/"
SRC_URI="https://github.com/thombashi/pytablewriter-altrow-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pytablewriter-0.59.0[${PYTHON_USEDEP}]
	>=dev-python/tcolorpy-0.0.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
