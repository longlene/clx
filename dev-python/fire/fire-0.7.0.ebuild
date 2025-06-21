# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Python Fire is a library for automatically generating command line interfaces (CLIs) from absolutely any Python object"
HOMEPAGE="https://github.com/google/python-fire"
SRC_URI="https://github.com/google/python-fire/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
"

S="${WORKDIR}"/python-${P}
