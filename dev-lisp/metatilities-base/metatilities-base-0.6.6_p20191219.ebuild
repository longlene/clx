# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef04337759972fd622c9b27b53149f3d594a841f"

DESCRIPTION="metabang.com's base set of core utilities"
HOMEPAGE="http://common-lisp.net/project/metatilities-base/"
SRC_URI="https://github.com/gwkkwg/metatilities-base/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/moptilities"

src_prepare() {
	default
	rm -rf ${PN}-test.asd unit-tests
}
