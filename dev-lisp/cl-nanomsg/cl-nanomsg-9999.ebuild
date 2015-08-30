# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="CL nanomsg bindings"
HOMEPAGE="https://github.com/orthecreedence/cl-nanomsg"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-nanomsg.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
"
