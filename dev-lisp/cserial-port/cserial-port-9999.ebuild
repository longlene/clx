# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="serial-port accessing library for Common Lisp"
HOMEPAGE="https://github.com/snmsts/cserial-port"
SRC_URI=""

EGIT_REPO_URI="https://github.com/snmsts/cserial-port.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/trivial-features
dev-lisp/iolib
"
