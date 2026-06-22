# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Expand standard functools to methods"
HOMEPAGE="https://github.com/youknowone/methodtools https://pypi.org/project/methodtools/"
SRC_URI="https://github.com/youknowone/methodtools/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/wirerope-0.4.7[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
