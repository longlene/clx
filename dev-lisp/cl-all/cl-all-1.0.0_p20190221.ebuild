# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="ce0865009057b2b152d935caeea5acc3b9a7aaa9"

DESCRIPTION="A script to evaluate lisp expressions in multiple implementations"
HOMEPAGE="https://github.com/Shinmera/cl-all/"
SRC_URI="https://github.com/Shinmera/cl-all/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/sbcl
"

src_install() {
	dobin cl-all
	dodoc README.mess
}
