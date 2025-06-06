# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Full-featured Telegram client library"
HOMEPAGE="
	https://pypi.org/project/telethon/
	https://github.com/LonamiWebs/Telethon
"
SRC_URI="https://github.com/LonamiWebs/Telethon/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyaes[${PYTHON_USEDEP}]
	dev-python/rsa[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/Telethon-${PV}
