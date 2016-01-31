# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

DESCRIPTION="A runtime for javascript applictions built on google v8 JS"
HOMEPAGE="http://fibjs.org"
SRC_URI="https://github.com/xicilion/fibjs/releases/download/v${PV}/${P}-fullsrc.zip"

LICENSE="GPL-3"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

