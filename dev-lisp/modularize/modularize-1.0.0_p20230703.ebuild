# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0548f2c5748d1b657ba5ae9c650efabb705b8583"

DESCRIPTION="A modularization framework"
HOMEPAGE="https://github.com/Shinmera/modularize"
SRC_URI="https://github.com/Shinmera/modularize/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/trivial-package-local-nicknames
"
BDEPEND=""
