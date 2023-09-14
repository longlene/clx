# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ee36c22a69a9516407458d2ed8b475f1fc473959"

DESCRIPTION="A standalone futures implementation for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-async-future"
SRC_URI="https://github.com/orthecreedence/cl-async-future/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

