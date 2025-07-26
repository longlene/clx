# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5008c4e4cac5dad8f00438c6d335f36bc4fa6747"

DESCRIPTION="Trivial interface for getting and parsing command-line-arguments"
HOMEPAGE="https://github.com/fare/command-line-arguments"
SRC_URI="https://github.com/fare/command-line-arguments/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

