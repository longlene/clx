# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Clojure style regular expression functions"
HOMEPAGE="https://github.com/dtenny/clj-re/"
SRC_URI="https://github.com/dtenny/clj-re/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.{asd,lisp}
}
