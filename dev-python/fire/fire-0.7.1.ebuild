# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="Python Fire is a library for automatically generating command line"
HOMEPAGE="https://github.com/google/python-fire"
SRC_URI="https://github.com/google/python-fire/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/python-${P}
KEYWORDS="~amd64 ~x86"
