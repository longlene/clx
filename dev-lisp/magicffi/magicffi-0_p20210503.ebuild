# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fa5f195b60a3e6d3d253531fd900cd6d970b8fcb"

DESCRIPTION="Common Lisp interface to libmagic based on CFFI"
HOMEPAGE="https://github.com/guicho271828/magicffi"
SRC_URI="https://github.com/guicho271828/magicffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	sys-apps/file
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem magicffi\/test/,$d' ${PN}.asd
	rm -rf tests
}
