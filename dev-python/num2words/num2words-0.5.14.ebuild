# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Modules to convert numbers to words"
HOMEPAGE="
	https://pypi.org/project/num2words/
	https://github.com/savoirfairelinux/num2words
"
SRC_URI="https://github.com/savoirfairelinux/num2words/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL LGPL )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
