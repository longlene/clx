# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="OMEMO for slixmpp"
HOMEPAGE="https://codeberg.org/poezio/slixmpp-omemo"
SRC_URI="https://codeberg.org/poezio/slixmpp-omemo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/slixmpp-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/omemo-backend-signal-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/omemo-0.14.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/${PN}
