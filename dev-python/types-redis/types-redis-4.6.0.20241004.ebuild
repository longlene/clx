# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Typing stubs for redis"
HOMEPAGE="https://github.com/python/typeshed https://pypi.org/project/types-redis/"
SRC_URI="https://files.pythonhosted.org/packages/3a/95/c054d3ac940e8bac4ca216470c80c26688a0e79e09f520a942bb27da3386/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
		dev-python/types-pyopenssl[${PYTHON_USEDEP}]
	')
"
