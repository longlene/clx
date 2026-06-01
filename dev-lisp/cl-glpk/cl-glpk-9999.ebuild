# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="FFI Bindings for GLPK"

SLOT="0"

RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/iterate
	sci-mathematics/glpk
"
