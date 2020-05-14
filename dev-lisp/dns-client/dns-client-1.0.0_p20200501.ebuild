# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46507870bb96838d6e4335b171033fd33323dd98"

DESCRIPTION="A pure-lisp DNs record client"
HOMEPAGE="https://github.com/Shinmera/dns-client"
SRC_URI="https://github.com/Shinmera/dns-client/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/documentation-utils
"
BDEPEND=""
