# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="9bdbc67f388b37aa111fcc3fa0cbea6f55372be4"

inherit common-lisp-3

DESCRIPTION="Implementation of a memory region abstraction"
HOMEPAGE="https://codeberg.org/shinmera/memory-regions"
SRC_URI="https://codeberg.org/shinmera/memory-regions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/documentation-utils
	dev-lisp/trivial-extensible-sequences
	dev-lisp/closer-mop
	dev-lisp/static-vectors
	dev-lisp/mmap
"
BDEPEND=""

S="${WORKDIR}"/${PN}
