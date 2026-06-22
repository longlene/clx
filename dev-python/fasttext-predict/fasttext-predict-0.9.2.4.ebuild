# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="fasttext with wheels and no external dependency, predict method only"
HOMEPAGE="https://github.com/searxng/fasttext-predict"
SRC_URI="https://github.com/searxng/fasttext-predict/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="$(python_gen_cond_dep '
	dev-python/pybind11[${PYTHON_USEDEP}]
')"
