# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Intelligent browser header & fingerprint generator"
HOMEPAGE="https://github.com/daijro/browserforge https://pypi.org/project/browserforge/"
SRC_URI="https://github.com/daijro/browserforge/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="orjson"

RDEPEND="
	>=dev-python/apify-fingerprint-datapoints-0.13.0[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	orjson? ( dev-python/orjson[${PYTHON_USEDEP}] )
"

RESTRICT="test"
