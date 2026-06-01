# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3
DESCRIPTION="implement of the ConfigParser Python module functionality in Common Lisp"
HOMEPAGE="http://common-lisp.net/project/py-configparser/"
SRC_URI="http://common-lisp.net/project/py-configparser/releases/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
