# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="A general purpose web agent in the spirit of WWW::Mechanize"
HOMEPAGE="https://launchpad.net/cl-kappa"
SRC_URI="https://launchpad.net/cl-kappa/trunk/0.8.0/+download/cl-kappa-0.8.0.tar.bz2 -> ${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/closure-html
virtual/puri
dev-lisp/drakma
dev-lisp/trivial-timeout
dev-lisp/alexandria
dev-lisp/cl-fad
dev-lisp/fiveam"

