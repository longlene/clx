# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="884bef69a1ea02f3b9deae0341e1a038ff31b896"

DESCRIPTION="An implementation of John McCarthy's ambiguous operator"
HOMEPAGE="https://github.com/phoe/amb"
SRC_URI="https://github.com/phoe/amb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:amb\/test/,$d' ${PN}.asd
	rm -rf t
}
