# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="94b16bfaf70f4d9394f333f207a11c9fb92a4641"

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
