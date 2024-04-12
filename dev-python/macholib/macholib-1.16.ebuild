# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1

DESCRIPTION="Mach-O header analysis and editing"
HOMEPAGE="http://bitbucket.org/ronaldoussoren/macholib"
SRC_URI="https://github.com/ronaldoussoren/macholib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
