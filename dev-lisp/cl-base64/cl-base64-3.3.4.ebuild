# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Common Lisp package to encode and decode base64 with URI support"
HOMEPAGE="http://www.cliki.net/cl-base64"
SRC_URI="http://files.kpe.io/${PN}/${PF}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/kmrcl"

src_prepare() {
	default
	sed -e '/defsystem cl-base64-tests/,$d' \
		-i ${PN}.asd
	rm tests.lisp
}
