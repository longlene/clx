# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Twitter X-Client-Transaction-Id generator written in python"
HOMEPAGE="
	https://pypi.org/project/xclienttransaction/
	https://github.com/iSarabjitDhiman/XClientTransaction
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
"

src_prepare() {
	# setup.py reads install_requires from requirements.txt, which upstream
	# forgot to include in the sdist; recreate it from the sdist's own
	# egg-info/requires.txt so setup.py can run at all.
	echo "beautifulsoup4" > requirements.txt || die
	distutils-r1_src_prepare
}
