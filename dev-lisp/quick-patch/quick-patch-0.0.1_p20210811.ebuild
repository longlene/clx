# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="22caecae6acfe92521ca7d67a8172ea25a3bd342"

DESCRIPTION="Easily override quicklisp projects without using git submodules"
HOMEPAGE="https://github.com/tdrhq/quick-patch"
SRC_URI="https://github.com/tdrhq/quick-patch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :quick-patch\/tests/,$d' ${PN}.asd
	rm test-impl.lisp
}
