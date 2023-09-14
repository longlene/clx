# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="427211c23521f8c2fb3467df4298f43648801b6d"

DESCRIPTION="A small common lisp library for coloring and styling ascii text "
HOMEPAGE="https://github.com/nmunro/cfmt"
SRC_URI="https://github.com/nmunro/cfmt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "cfmt\/tests/,$d' ${PN}.asd
	rm -rf tests
}
