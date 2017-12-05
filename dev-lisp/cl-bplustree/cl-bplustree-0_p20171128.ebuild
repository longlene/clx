# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7e08f901aa8797190018666d7a3147ec8fde2fc5"

DESCRIPTION="A Common Lisp implementation of an in-memory B+ tree"
HOMEPAGE="https://github.com/ebobby/cl-bplustree"
SRC_URI="https://github.com/ebobby/cl-bplustree/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	rm test.lisp
}
