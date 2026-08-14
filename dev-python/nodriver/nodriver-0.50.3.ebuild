# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Blazing fast, undetectable browser automation framework"
HOMEPAGE="
	https://pypi.org/project/nodriver/
	https://github.com/UltrafunkAmsterdam/nodriver
"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/mss[${PYTHON_USEDEP}]
	>=dev-python/websockets-14[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
"
