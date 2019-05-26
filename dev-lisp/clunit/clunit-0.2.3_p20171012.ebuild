# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f6d72873f0e1207f037470105969384f8380628"

DESCRIPTION="CLUnit: A Common Lisp Unit Testing Framework"
HOMEPAGE="https://github.com/tgutu/clunit"
SRC_URI="https://github.com/tgutu/clunit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

