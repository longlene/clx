# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="84171dab96dfd791f08a562a07604520c58fdad6"

DESCRIPTION=""
HOMEPAGE="https://github.com/Shinmera/messagebox"
SRC_URI="https://github.com/Shinmera/messagebox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/documentation-utils
"
BDEPEND=""
