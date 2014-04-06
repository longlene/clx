# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 common-lisp-2

DESCRIPTION="A matrix package for common lisp"
HOMEPAGE="http://github.com/blindglobe/lisp-matrix"
SRC_URI=""

EGIT_REPO_URI="https://github.com/blindglobe/lisp-matrix.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/cl-utilities
dev-lisp/xarray
dev-lisp/lift
dev-lisp/foreign-numeric-vector
dev-lisp/cl-blapack
dev-lisp/ffa"

#CLSYSTEMS=""
#src_unpack() {
#	unpack ${A}
#	mv *-${PN}-* "${S}"
#}

#src_install() {
#	common-lisp-install ${PN}.asd *.lisp standard
#	common-lisp-symlink-asdf
#
#	dodoc COPYING CREDITS INSTALL licenses/*
#}
