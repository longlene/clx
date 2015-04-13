# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="A simple mechanism to auto-load Lisp libraries from respositories"
HOMEPAGE="https://github.com/billstclair/cl-autorepo"
SRC_URI="https://github.com/billstclair/cl-autorepo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

