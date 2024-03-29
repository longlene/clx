# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="python binding for libvips using cffi"
HOMEPAGE="https://github.com/jcupitt/pyvips"
SRC_URI="https://github.com/jcupitt/pyvips/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/cffi"
RDEPEND="${DEPEND}"
