# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3315a562e794560fcf8be793aceb5deb2c0404a4"

DESCRIPTION="An extensible iteration macro library"
HOMEPAGE="https://github.com/Shinmera/for"
SRC_URI="https://github.com/Shinmera/for/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/lambda-fiddle
	dev-lisp/form-fiddle
"
