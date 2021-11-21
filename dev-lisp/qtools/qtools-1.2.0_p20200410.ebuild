# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0f10649913ed74afa356b3ade9ed0d33aa779f33"

DESCRIPTION="A collection of utilities to aid development with CommonQt"
HOMEPAGE="https://shinmera.github.io/qtools"
SRC_URI="https://github.com/Shinmera/qtools/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/commonqt
	dev-lisp/deploy
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/form-fiddle
	dev-lisp/named-readtable
	dev-lisp/trivial-indent
	dev-lisp/trivial-garbage
	dev-lisp/trivial-main-thread
	dev-lisp/documentation-utils
"
