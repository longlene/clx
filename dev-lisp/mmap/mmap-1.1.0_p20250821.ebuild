# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="d8d4fad5db120eb99559340a3a2cc74c53b9f09a"

inherit common-lisp-3

DESCRIPTION="Portable mmap (file memory mapping) utility library"
HOMEPAGE="https://codeberg.org/shinmera/mmap"
SRC_URI="https://codeberg.org/shinmera/mmap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
S="${WORKDIR}"/${PN}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/documentation-utils
	dev-lisp/pathname-utils
"
