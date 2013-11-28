# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

MY_P="v${PV}"

DESCRIPTION='CL-WHO (is yet another Lisp Markup Language).'
HOMEPAGE="http://weitz.de/cl-who/"
SRC_URI="https://github.com/edicl/${PN}/archive/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dodoc CHANGELOG
	dohtml doc/*.html
}
