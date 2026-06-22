# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Tool and library for decrypting/encrypting MS Office files with passwords"
HOMEPAGE="
	https://msoffcrypto-tool.readthedocs.io/
	https://github.com/nolze/msoffcrypto-tool/
	https://pypi.org/project/msoffcrypto-tool/
"
SRC_URI="https://github.com/nolze/msoffcrypto-tool/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/olefile[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
