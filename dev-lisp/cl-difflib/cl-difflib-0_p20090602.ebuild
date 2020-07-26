# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="98eb335c693f1881584b83ca7be4a0fe05355c4e"

DESCRIPTION="CL-DIFFLIB is a Lisp library for computing differences between sequences."
HOMEPAGE="https://github.com/wiseman/cl-difflib"
SRC_URI="https://github.com/wiseman/cl-difflib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

