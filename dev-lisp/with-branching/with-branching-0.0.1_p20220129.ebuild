# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGTI_COMMIT="53b7d7963fbeca8c9b2ed6c6d77fddce51773c68"

DESCRIPTION="An implementation of macroexpand-time conditionalization"
HOMEPAGE="https://github.com/phoe/with-branching/"
SRC_URI="https://github.com/phoe/with-branching/archive/${EGTI_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-indent
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:with-branching\/test/,$d' ${PN}.asd
	rm ${PN}-test.lisp
}
