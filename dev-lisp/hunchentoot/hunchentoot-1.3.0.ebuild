# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Hunchentoot is a web server written in Common Lisp."
HOMEPAGE="https://github.com/edicl/hunchentoot/"
SRC_URI="https://github.com/edicl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND="doc? ( dev-libs/libxslt )"
RDEPEND=">=dev-lisp/bordeaux-threads-0.7.0
	>=dev-lisp/chunga-1.1.1
	>=dev-lisp/cl-base64-3.3.0
	>=dev-lisp/cl-fad-0.6.3
	dev-lisp/cl-plus-ssl
	>=dev-lisp/cl-ppcre-2.0.0
	>=dev-lisp/cl-who-0.11.1
	>=dev-lisp/drakma-1.0.0
	>=dev-lisp/flexi-streams-0.12.0
	>=dev-lisp/md5-1.8.5
	>=dev-lisp/rfc2388-1.2
	>=dev-lisp/trivial-backtrace-1.0.2
	>=dev-lisp/usocket-0.4.0"

src_compile() {
	use doc && xsltproc doc/clixdoc.xsl doc/index.xml > doc/index.html
}

src_install() {
	common-lisp-install-sources *.lisp url-rewrite
	common-lisp-install-sources -t all www test
	common-lisp-install-asdf
	dodoc CHANGELOG* README
	use doc && dodoc -r doc/*
}
