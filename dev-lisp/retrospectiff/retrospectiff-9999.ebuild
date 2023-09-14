# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Retrospectiff is a common lisp library for reading and writing images in the TIFF format"
HOMEPAGE="https://github.com/slyrus/retrospectiff"
SRC_URI=""

EGIT_REPO_URI="https://github.com/slyrus/retrospectiff.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/ieee-floats
dev-lisp/com_gigamonkeys_binary-data"

