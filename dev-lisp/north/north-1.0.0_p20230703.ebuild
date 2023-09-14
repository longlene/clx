# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c128cb0b7976417307a387ea6c1c30228d58cd50"

DESCRIPTION="An oAuth 1.0a Server & Client"
HOMEPAGE="https://github.com/Shinmera/north"
SRC_URI="https://github.com/Shinmera/north/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uuid
	dev-lisp/crypto-shortcuts
	dev-lisp/cl-ppcre
	dev-lisp/drakma
	dev-lisp/documentation-utils
"
