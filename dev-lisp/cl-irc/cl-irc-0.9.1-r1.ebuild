# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Common Lisp IRC client library"
HOMEPAGE="http://common-lisp.net/project/cl-irc/"
SRC_URI="http://common-lisp.net/project/${PN}/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/split-sequence
		dev-lisp/usocket
		dev-lisp/flexi-streams"

src_prepare() {
	sed -i '/sb-thread/{s/destroy-thread/terminate-thread/}' protocol.lisp

}

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dodoc CREDITS ChangeLog README
	docinto doc && dodoc doc/*.txt
	docinto example && dodoc example/*
}
