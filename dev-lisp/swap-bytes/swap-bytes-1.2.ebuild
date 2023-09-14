# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3

DESCRIPTION="Efficient endianness conversion for SBCL"
HOMEPAGE="https://github.com/sionescu/swap-bytes"
SRC_URI="https://github.com/sionescu/swap-bytes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-features"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
