# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dad706a5bf44f868b05ba78328eeee1885aa1925"

DESCRIPTION="Golang like channels for Common Lisp"
HOMEPAGE="https://github.com/notflan/cl-channel"
SRC_URI="https://github.com/notflan/cl-channel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""
