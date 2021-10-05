# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b37cc4740a738e3885aa4ce162baadcc9315b1e3"

DESCRIPTION="A simple TCP client implementation for lichat"
HOMEPAGE="https://github.com/Shirakumo/lichat-tcp-client"
SRC_URI="https://github.com/Shirakumo/lichat-tcp-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lichat-protocol
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-utils
	dev-lisp/verbose
"
BDEPEND=""
