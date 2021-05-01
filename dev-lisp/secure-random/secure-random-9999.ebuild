# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Cryptographically secure pseudo-random number generator for Common Lisp"
HOMEPAGE="https://github.com/avodonosov/secure-random"
SRC_URI=""

EGIT_REPO_URI="https://github.com/avodonosov/secure-random.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-plus-ssl
"
