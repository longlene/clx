# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

ION_C_COMMIT="d61c09af3465edc4bb1a50bb542320034a1e1519"

DESCRIPTION="A Python implementation of Amazon Ion"
HOMEPAGE="https://github.com/amzn/ion-python"
SRC_URI="
	https://github.com/amazon-ion/ion-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/amzn/ion-c/archive/${ION_C_COMMIT}.tar.gz -> ion-c-${ION_C_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/py-build-cmake[${PYTHON_USEDEP}]
"

RESTRICT="test"
