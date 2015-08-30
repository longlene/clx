# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A couple of lambda shorthand macros"
HOMEPAGE="https://github.com/cbaggers/fn"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/fn.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/macroexpand-dammit
dev-lisp/named-readtables
"
