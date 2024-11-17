# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="b77e5bc7cb1a198f2cbf0366bf9acc10b8e67dd5"

DESCRIPTION="Python rison encoder/decoder"
HOMEPAGE="https://github.com/betodealmeida/python-rison"
SRC_URI="https://github.com/betodealmeida/python-rison/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/python-rison-${EGIT_COMMIT}

