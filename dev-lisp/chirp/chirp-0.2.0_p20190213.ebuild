# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4b2607a7c8efa96bf1d4a963dd10923d52690dba"

DESCRIPTION="A twitter client library for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/chirp"
SRC_URI="https://github.com/Shinmera/chirp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
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
