# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Type annotations and code completion for botocore"
HOMEPAGE="https://github.com/youtype/botocore-stubs https://pypi.org/project/botocore-stubs/"

S="${WORKDIR}/botocore_stubs-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="botocore"

RDEPEND="
	dev-python/types-awscrt[${PYTHON_USEDEP}]
	botocore? ( dev-python/botocore[${PYTHON_USEDEP}] )
"
