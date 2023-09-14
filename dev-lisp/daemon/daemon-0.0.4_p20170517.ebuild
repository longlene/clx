# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d5652f4332c3cee21e9bf83b9237129605004597"

DESCRIPTION="daemonize lisp process"
HOMEPAGE="https://github.com/snmsts/daemon"
SRC_URI="https://github.com/snmsts/daemon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

