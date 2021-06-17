# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="02e1a12afba5178cb3242360351281a24b6b3da1"

DESCRIPTION="Generic functions that can specialize on special/dynamic variables"
HOMEPAGE="https://github.com/markasoftware/context-lite/"
SRC_URI="https://github.com/markasoftware/context-lite/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:context-lite\/test/,$d' ${PN}.asd
}
