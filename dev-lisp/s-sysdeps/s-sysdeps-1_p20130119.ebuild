# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d28246b5dffef9e73a0e0e6cfbc4e878006fe34d"

DESCRIPTION="A Common Lisp library implementing an abstraction layer over platform dependent functionality."
HOMEPAGE="http://homepage.mac.com/svc/s-sysdeps/"
SRC_URI="https://github.com/svenvc/s-sysdeps/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

