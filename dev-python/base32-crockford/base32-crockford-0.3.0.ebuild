# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A Python implementation of Douglas Crockford's base32 encoding scheme"
HOMEPAGE="https://github.com/jbittel/base32-crockford https://pypi.org/project/base32-crockford/"
SRC_URI="https://files.pythonhosted.org/packages/a8/e7/868d9b106ffb86ebf1eb877517e03ac87667ce5ce201547fa3a26090c1ba/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
