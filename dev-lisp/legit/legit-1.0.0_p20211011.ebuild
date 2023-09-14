# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5f8a2d4c4f5fb8e53340eeef600433ee20e03fbe"

DESCRIPTION="CL interface to the GIT binary"
HOMEPAGE="https://shinmera.github.io/legit/"
SRC_URI="https://github.com/Shinmera/legit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/simple-inferiors
	dev-lisp/lambda-fiddle
	dev-lisp/cl-ppcre
	dev-lisp/documentation-utils
"
