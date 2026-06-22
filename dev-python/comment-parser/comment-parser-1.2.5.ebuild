# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Parse comments from various source files"
HOMEPAGE="https://github.com/jeanralphaviles/comment_parser https://pypi.org/project/comment-parser/"

S="${WORKDIR}/comment_parser-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
')"
