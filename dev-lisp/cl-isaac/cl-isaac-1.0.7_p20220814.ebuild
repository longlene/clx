# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9cd88f39733be753facbf361cb0e08b9e42ff8d5"

DESCRIPTION="a fast cryptographic random number generator"
HOMEPAGE="https://github.com/thephoeron/cl-isaac"
SRC_URI="https://github.com/thephoeron/cl-isaac/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}
