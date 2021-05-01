# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="intend to be a language-server and more"
HOMEPAGE="https://github.com/snmsts/cl-langserver"
SRC_URI=""

EGIT_REPO_URI="https://github.com/snmsts/cl-langserver.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jsonrpc
"
