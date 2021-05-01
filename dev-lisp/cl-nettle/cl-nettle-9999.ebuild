# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Nettle bindings"
HOMEPAGE="https://github.com/orthecreedence/cl-nettle"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-nettle.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/static-vectors
dev-lisp/babel
dev-lisp/defstar
"
