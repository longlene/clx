# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89081a38d35a6159cdf9e46f4ea06dcb98755b91"

DESCRIPTION="Basic utilities for language models in Common Lisp"
HOMEPAGE="https://github.com/joergen7/lang-util/"
SRC_URI="https://github.com/joergen7/lang-util/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :lang-util\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
