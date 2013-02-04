# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils multilib

MY_PN=cl+ssl
MY_P=cl-plus-ssl

DESCRIPTION="A simple Common Lisp interface to OpenSSL."
HOMEPAGE="http://common-lisp.net/project/cl-plus-ssl/"
SRC_URI="https://mydebian.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~sparc ~amd64 ~ppc"
IUSE=""

RDEPEND=">=dev-lisp/cffi-0.10.6-r1
		dev-lisp/trivial-gray-streams
		dev-lisp/flexi-streams
		dev-libs/openssl"

CLPACKAGE=${MY_PN}
CLSYSTEMS=${MY_PN}

S="${WORKDIR}"/${MY_P}

src_unpack() {
	unpack ${A}
	rm "${S}"/Makefile
	sed -i "s,/usr/lib,/usr/$(get_libdir),g" "${S}"/${MY_PN}.asd
}

src_install() {
	cd "${S}"
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	dohtml index.{css,html}
}
