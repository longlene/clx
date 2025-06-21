# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4922aaff5d738231446b5aa803f5325218905573"

DESCRIPTION="A collection of portable random generators for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/random-state"
SRC_URI="https://github.com/Shinmera/random-state/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""
