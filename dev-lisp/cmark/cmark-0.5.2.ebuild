# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="CommonMark implementation for Common Lisp based on libcmark"
HOMEPAGE="https://github.com/HiPhish/cl-cmark"
SRC_URI="https://github.com/HiPhish/cl-cmark/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	app-text/cmark
	dev-lisp/cffi
	dev-lisp/flexi-streams
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:cmark\/test/,$d' \
		-i ${PN}.asd
	sed -e '/defsystem #:libcmark\/test/,$d' \
		-i libcmark.asd
	rm -rf test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}
