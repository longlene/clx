# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="The personal URL shortener"
HOMEPAGE="https://github.com/zkat/shortening"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zkat/shortening.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/py-configparser
	dev-lisp/cl-yaclml
"

src_install() {
	common-lisp-3_src_install
	insinto /etc
	newins shortening.conf.example shortening.conf
}
