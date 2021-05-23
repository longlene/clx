# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1add9208053ce47df5a942962308e4bc51100071"

DESCRIPTION="A portable atomic library for Common Lisp"
HOMEPAGE="https://github.com/muyinliu/cl-atomic"
SRC_URI="https://github.com/muyinliu/cl-atomic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-{test,benchmark}.asd test
}
