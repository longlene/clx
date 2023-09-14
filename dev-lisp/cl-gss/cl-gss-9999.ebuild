# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings for GSS-API"
HOMEPAGE="https://github.com/lokedhs/cl-gss"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lokedhs/cl-gss.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/trivial-utf8
	dev-lisp/
"
