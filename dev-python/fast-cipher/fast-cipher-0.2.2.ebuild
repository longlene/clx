# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="FAST format-preserving encryption cipher in pure Python"
HOMEPAGE="
	https://pypi.org/project/fast-cipher/
	https://github.com/jedisct1/py-fast
"

# No license is declared anywhere upstream (PyPI metadata, GitHub repo root,
# README all lack one) as of 0.2.2.
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
