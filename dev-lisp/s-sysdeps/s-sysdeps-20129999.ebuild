# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp library implementing an abstraction layer over platform dependent functionality."
HOMEPAGE="http://homepage.mac.com/svc/s-sysdeps/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/svenvc/s-sysdeps.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"



src_install() {
	dohtml doc/*.html
	common-lisp-3_src_install
}
