# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4cf7e90a1fa4f7174f93c551742dfdb56a866ede"

DESCRIPTION="Libevent2 bindings for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-libevent2"
SRC_URI="https://github.com/orthecreedence/cl-libevent2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/libevent
"

