# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Schema-based serialization, deserialization and validation library"
HOMEPAGE="https://github.com/Pylons/colander
	https://docs.pylonsproject.org/projects/colander"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/iso8601[${PYTHON_USEDEP}]
	dev-python/translationstring[${PYTHON_USEDEP}]
"

RESTRICT="test"
