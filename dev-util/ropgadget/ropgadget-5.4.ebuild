# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="This tool lets you search your gadgets on your binaries to facilitate your ROP exploitation"
HOMEPAGE="http://www.shell-storm.org/project/ROPgadget/"
SRC_URI="https://github.com/JonathanSalwan/ROPgadget/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/capstone
"
