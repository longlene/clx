# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="07150b947856b94dff26ced0a501ca612333e734"

DESCRIPTION="Access to common file attributes"
HOMEPAGE="https://github.com/Shinmera/file-attributes"
SRC_URI="https://github.com/Shinmera/file-attributes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/documentation-utils
"
BDEPEND=""
