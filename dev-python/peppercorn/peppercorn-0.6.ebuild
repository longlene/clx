# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Token stream to data structure conversion for web form posts"
HOMEPAGE="https://github.com/Pylons/peppercorn
	https://docs.pylonsproject.org/projects/peppercorn"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${PYTHON_DEPS}"

RESTRICT="test"
