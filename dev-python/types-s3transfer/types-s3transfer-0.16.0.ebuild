# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Type annotations and code completion for s3transfer"
HOMEPAGE="https://github.com/youtype/types-s3transfer https://pypi.org/project/types-s3transfer/"

S="${WORKDIR}/types_s3transfer-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
