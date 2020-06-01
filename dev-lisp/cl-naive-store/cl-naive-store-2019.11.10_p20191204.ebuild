# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="34971cd3e33237acb3d1aab11705bd6b05fa83d5"

DESCRIPTION="A naive, persisted, in memory data store for Common Lisp"
HOMEPAGE="https://gitlab.com/Harag/cl-naive-store"
SRC_URI="https://gitlab.com/Harag/cl-naive-store/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/uuid
	dev-lisp/local-time
"
BDEPEND=""
