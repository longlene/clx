# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 eutils

DESCRIPTION="Drakma is a Common Lisp HTTP client."
HOMEPAGE="http://weitz.de/drakma/"
SRC_URI="https://github.com/edicl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/chipz
		>=dev-lisp/chunga-1.1.0
		>=dev-lisp/puri-1.5.0
		>=dev-lisp/cl-base64-3.3.2
		>=dev-lisp/flexi-streams-1.0.7
		>=dev-lisp/usocket-0.4.0
		dev-lisp/cl-plus-ssl"

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}

src_install() {
	common-lisp-3_src_install
	dodoc docs/index.html
}
