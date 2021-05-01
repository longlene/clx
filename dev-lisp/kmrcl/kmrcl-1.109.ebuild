# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3

DESCRIPTION="General Utilities for Common Lisp Programs from Kevin Rosenberg"
HOMEPAGE="http://www.cliki.net/kmrcl"
SRC_URI="http://files.kpe.io/${PN}/${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/rt"

CLSYSTEMS="${PN} ${PN}-tests"

run_test() {
	local lisp="${1}"
	if has_version "dev-lisp/${lisp}" ; then
		emake test-"${lisp}"
	fi
}

src_compile() { :; }

src_test() {
	for l in sbcl cmucl clisp ; do
		run_test "${l}"
	done
}
