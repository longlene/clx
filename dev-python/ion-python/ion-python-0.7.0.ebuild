# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="A Python implementation of Amazon Ion"
HOMEPAGE="https://github.com/amzn/ion-python"
SRC_URI="https://github.com/amzn/ion-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/jsonconversion
"
BDEPEND=""
