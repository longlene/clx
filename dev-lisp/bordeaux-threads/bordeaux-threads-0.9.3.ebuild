# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A library meant to make writing portable multi-threaded apps simple."
HOMEPAGE="http://common-lisp.net/project/bordeaux-threads/"
SRC_URI="https://github.com/sionescu/bordeaux-threads/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="
	dev-lisp/alexandria
	dev-lisp/global-vars
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
"

src_prepare() {
	default
	sed -e '/defsystem :bordeaux-threads\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
