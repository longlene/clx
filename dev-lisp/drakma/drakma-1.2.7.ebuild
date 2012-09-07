# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3 eutils

DESCRIPTION="Drakma is a Common Lisp HTTP client."
HOMEPAGE="http://weitz.de/drakma/"
SRC_URI="https://github.com/downloads/edicl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		>=dev-lisp/chunga-1.1.0
		>=dev-lisp/puri-1.5.0
		>=dev-lisp/cl-base64-3.3.2
		>=dev-lisp/flexi-streams-1.0.7
		>=dev-lisp/usocket-0.4.0
		dev-lisp/cl-plus-ssl"

src_install() {
	common-lisp-3_src_install
	dohtml doc/index.html
}
