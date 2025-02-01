# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="adec977493c031be9821ad05da5bf7d545b2c461"

DESCRIPTION="g2p module for Korean"
HOMEPAGE="
	https://github.com/harmlessman/g2pkk
	https://pypi.org/project/g2pkk/
"
SRC_URI="https://github.com/harmlessman/g2pkk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/jamo[${PYTHON_USEDEP}]
	dev-python/nltk[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
