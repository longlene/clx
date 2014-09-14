# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit cmake-utils

DESCRIPTION="A simple, easily embeddable cross-platform C library"
HOMEPAGE="https://github.com/redjack/libcork"
SRC_URI="https://github.com/redjack/libcork/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/check"

