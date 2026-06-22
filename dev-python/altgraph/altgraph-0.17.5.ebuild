# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="Python graph (network) package"
HOMEPAGE="
	https://altgraph.readthedocs.io/
	https://github.com/ronaldoussoren/altgraph/
"
SRC_URI="https://github.com/ronaldoussoren/altgraph/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"
