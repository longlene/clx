# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e67f56bb697bdeac81e28e1cca4a5d117a9cf125"

DESCRIPTION="Rectangle packer for sprite/texture atlases"
HOMEPAGE="https://github.com/lispgames/binpack"
SRC_URI="https://github.com/lispgames/binpack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test*.lisp *-test.lisp
}
