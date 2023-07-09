# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="adc2d81d6bc14684897cbd4b7812de3647d35e88"

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
