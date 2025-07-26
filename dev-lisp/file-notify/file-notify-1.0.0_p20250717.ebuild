# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="9fdae0cd18e8342ad5e520346a1ee391708f653f"

DESCRIPTION="Access to file change and access notification"
HOMEPAGE="https://github.com/Shinmera/file-notify"
SRC_URI="https://github.com/Shinmera/file-notify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/documentation-utils
	dev-lisp/cffi
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
