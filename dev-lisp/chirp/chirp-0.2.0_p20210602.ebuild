# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="01c79fa41939688216d1f86d0766a687becb0654"

DESCRIPTION="A twitter client library for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/chirp"
SRC_URI="https://github.com/Shinmera/chirp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/yason
	dev-lisp/split-sequence
	dev-lisp/uuid
	dev-lisp/ironclad
	dev-lisp/flexi-streams
	dev-lisp/local-time
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/dexador
	dev-lisp/drakma
"
