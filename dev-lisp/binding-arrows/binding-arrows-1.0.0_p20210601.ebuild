# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d19364ec8850880ed6e42078ccaa2ed9114dc83a"

DESCRIPTION="An implementation of threading macros based on binding anonymous variables"
HOMEPAGE="https://github.com/phoe/binding-arrows"
SRC_URI="https://github.com/phoe/binding-arrows/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:binding-arrows\/test/,$d' ${PN}.asd
	rm -rf t
}
