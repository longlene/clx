# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c749f32c9b606a1457daa47d59630708ac0c266e"

DESCRIPTION="Define efficient global variables in Common Lisp"
HOMEPAGE="https://github.com/lmj/global-vars"
SRC_URI="https://github.com/lmj/global-vars/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd ${PN}-test.lisp
}
