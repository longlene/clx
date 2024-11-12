# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="class and tools for handling of IPv4 and IPv6 addresses and networks"
HOMEPAGE="https://github.com/autocracy/python-ipy/"
SRC_URI="https://github.com/autocracy/python-ipy/archive/refs/tags/IPy-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-ipy-IPy-${PV}
