# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Filesystem-like pathing and searching for dictionaries"
HOMEPAGE="
	https://github.com/dpath-maintainers/dpath-python
	https://pypi.org/project/dpath/
"
SRC_URI="https://github.com/dpath-maintainers/dpath-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
RESTRICT="test"

S="${WORKDIR}"/${PN}-python-${PV}
