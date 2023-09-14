# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8850b6dd7e7e1ac9d32bfda8fbb6715c524894b8"

DESCRIPTION="Foreign library collection for bodge-glfw"
HOMEPAGE="https://github.com/borodust/glfw-blob"
SRC_URI="https://github.com/borodust/glfw-blob/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bodge-blobs-support
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all x86_64
}
