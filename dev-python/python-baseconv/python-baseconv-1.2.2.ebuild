# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Convert numbers from base 10 integers to base X strings and back"
HOMEPAGE="https://github.com/semente/python-baseconv"
SRC_URI="https://github.com/semente/python-baseconv/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64"
