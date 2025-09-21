# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="OMEMO for slixmpp"
HOMEPAGE="https://github.com/Syndace/slixmpp-omemo"
SRC_URI="https://github.com/Syndace/slixmpp-omemo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/slixmpp-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/omemo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/oldmemo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/twomemo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)
