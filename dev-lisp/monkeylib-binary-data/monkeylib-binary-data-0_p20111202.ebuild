# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="22e908976d7f3e2318b7168909f911b4a00963ee"

DESCRIPTION="Library for reading and writing binary data"
HOMEPAGE="https://github.com/gigamonkey/monkeylib-binary-data"
SRC_URI="https://github.com/gigamonkey/monkeylib-binary-data/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria"

