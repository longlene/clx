# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Tiny Common Lisp library to detect mime in files"
HOMEPAGE="https://github.com/Shinmera/trivial-mimes"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Shinmera/trivial-mimes.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources -t all mime-types.lisp mime.types
	common-lisp-install-asdf ${PN}.asd
}
