# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="647e1f486a064cffc0af03feeae9d57ffc7ec4a5"

DESCRIPTION="A simple TCP server implementation for lichat"
HOMEPAGE="https://github.com/Shirakumo/lichat-tcp-server"
SRC_URI="https://github.com/Shirakumo/lichat-tcp-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lichat-protocol
	dev-lisp/lichat-serverlib
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-utils
	dev-lisp/verbose
"
BDEPEND=""
