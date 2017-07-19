# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="60828f1f6f5269efc3e109113ce74c868fd1b61d"

DESCRIPTION="Common Lisp library for interacting with Oracle via OCILIB"
HOMEPAGE="https://github.com/archimag/cl-oracle"
SRC_URI="https://github.com/archimag/cl-oracle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/oracle-instantclient
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/parse-number"

