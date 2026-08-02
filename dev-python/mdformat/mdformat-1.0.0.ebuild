# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="CommonMark compliant Markdown formatter"
HOMEPAGE="https://github.com/hukkin/mdformat"
SRC_URI="https://github.com/hukkin/mdformat/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/markdown-it-py-1[${PYTHON_USEDEP}]
	<dev-python/markdown-it-py-5[${PYTHON_USEDEP}]
"
