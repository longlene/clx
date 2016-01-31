# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Read EXIF data from image files"
HOMEPAGE="https://github.com/xach/zpb-exif"
SRC_URI="mirror://github/xach/zpb-exif/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

