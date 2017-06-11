# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="be6f76104b94cf04f530c1ac2c5470d569b8649d"

DESCRIPTION="brainfuck interpreter/compiler in Common Lisp"
HOMEPAGE="https://github.com/jdtw/brainfuck"
SRC_URI="https://github.com/jdtw/brainfuck/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

