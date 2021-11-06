# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A compression library for creating data in the ZLIB, DEFLATE, or GZIP data formats."
HOMEPAGE="http://www.xach.com/lisp/salza2/"
SRC_URI="https://github.com/xach/salza2/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dohtml doc/index.html
}
