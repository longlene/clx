# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b267b40659c5eb1ef898c1f4c4e6db0e7f885a0c"

DESCRIPTION="Common Lisp interface for Enchant spell-checker library"
HOMEPAGE="https://github.com/tlikonen/cl-enchant"
SRC_URI="https://github.com/tlikonen/cl-enchant/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	app-text/enchant
"

