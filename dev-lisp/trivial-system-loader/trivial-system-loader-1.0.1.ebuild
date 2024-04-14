# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A system installation/loading abstraction for Common Lisp"
HOMEPAGE="https://github.com/atgreen/trivial-system-loader"
SRC_URI="https://github.com/atgreen/trivial-system-loader/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	common-lisp-install-sources -t all version.sexp
	common-lisp-3_src_install
}
