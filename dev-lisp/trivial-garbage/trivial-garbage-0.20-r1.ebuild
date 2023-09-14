# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Provides a portable library to finalizers, weak hash-tables and weak pointers."
HOMEPAGE="http://www.cliki.net/trivial-garbage"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="test"

RDEPEND="
	test? ( dev-lisp/rt )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem trivial-garbage-tests/,$d' ${PN}.asd
		rm tests.lisp
	fi
}

