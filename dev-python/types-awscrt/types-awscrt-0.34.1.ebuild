# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Type annotations and code completion for awscrt"
HOMEPAGE="https://github.com/youtype/types-awscrt https://pypi.org/project/types-awscrt/"

S="${WORKDIR}/types_awscrt-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
