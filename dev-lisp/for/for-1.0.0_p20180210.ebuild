# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f8a1bf9f27c329b7c3a05f6685911c1fc72c5a9"

DESCRIPTION="An extensible iteration macro library"
HOMEPAGE="https://github.com/Shinmera/for"
SRC_URI="https://github.com/Shinmera/for/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/lambda-fiddle
	dev-lisp/form-fiddle
"
