# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Websocket client library"
HOMEPAGE="https://github.com/wildfoundry/dataplicity-lomond"
SRC_URI="https://github.com/wildfoundry/dataplicity-lomond/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/dataplicity-lomond-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
