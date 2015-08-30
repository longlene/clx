# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="CONSPACK implementation for Common Lisp"
HOMEPAGE="https://github.com/conspack/cl-conspack"
SRC_URI=""

EGIT_REPO_URI="https://github.com/conspack/cl-conspack.git"

LICENSE="NewBSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/closer-mop
dev-lisp/alexandria
dev-lisp/ieee-floats
dev-lisp/trivial-utf8
dev-lisp/fast-io
dev-lisp/trivial-garbage
"
