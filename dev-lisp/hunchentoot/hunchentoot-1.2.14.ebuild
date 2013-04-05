# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Hunchentoot is a web server written in Common Lisp."
HOMEPAGE="http://weitz.de/hunchentoot/"
SRC_URI="https://github.com/edicl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~sparc x86"
IUSE="doc"

DEPEND="doc? ( dev-libs/libxslt )"
RDEPEND=">=dev-lisp/chunga-0.5.0
		>=dev-lisp/cl-base64-3.3.0
		>=dev-lisp/cl-fad-0.6.3
		>=dev-lisp/cl-ppcre-2.0.0
		>=dev-lisp/flexi-streams-0.12.0
		>=dev-lisp/cl-plus-ssl-20081104
		>=dev-lisp/md5-1.8.5
		>=dev-lisp/rfc2388-1.2
		>=dev-lisp/trivial-backtrace-1.0.2
		>=dev-lisp/usocket-0.4.0
		>=dev-lisp/bordeaux-threads-0.7.0
		>=dev-lisp/cl-who-0.11.1
		>=dev-lisp/drakma-1.0.0"

src_compile() {
	use doc && xsltproc doc/clixdoc.xsl doc/index.xml > doc/index.html
}

src_install() {
	common-lisp-install-sources *.lisp url-rewrite/ test/
	common-lisp-install-sources -t all www/
	common-lisp-install-asdf
	dodoc CHANGELOG* README
	use doc && dohtml -r doc/*
}
