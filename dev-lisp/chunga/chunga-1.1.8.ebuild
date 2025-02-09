# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Portable chunked streams for Common Lisp"
HOMEPAGE="http://weitz.de/chunga/"
SRC_URI="https://github.com/edicl/chunga/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="
	dev-lisp/trivial-gray-streams
"

