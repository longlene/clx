# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66de2e5f64059b87f84842b0a8f6a3392a468bc8"

DESCRIPTION="A Common Lisp implementation of CORBA"
HOMEPAGE="http://clorb.sourceforge.net/"
SRC_URI="https://github.com/usocket/clorb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/usocket
"

