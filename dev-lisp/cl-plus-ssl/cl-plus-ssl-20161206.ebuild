# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="98d5c0399e3224e10841e54a16c08d6ee05f2d82"

DESCRIPTION="A simple Common Lisp interface to OpenSSL."
HOMEPAGE="http://common-lisp.net/project/cl-plus-ssl/"
SRC_URI="https://github.com/cl-plus-ssl/cl-plus-ssl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lisp/cffi-0.10.6-r1
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-libs/openssl
"

src_prepare() {
	rm Makefile
	use test || rm -r cl+ssl.test.asd test
}
