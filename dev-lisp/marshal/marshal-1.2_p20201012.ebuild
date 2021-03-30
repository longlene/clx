# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="79c518bfb1431e8d1bcac462fa23ae2d206a38c2"

DESCRIPTION="Simple and fast serialization of all kinds of Common Lisp data structures"
HOMEPAGE="https://github.com/wlbr/cl-marshal"
SRC_URI="https://github.com/wlbr/cl-marshal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rm ${PN}-tests.asd tests.lisp
}
