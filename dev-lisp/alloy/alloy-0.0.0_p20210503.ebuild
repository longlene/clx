# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9158a2b6f0bf39df6677ece2cf27109677f64b92"

DESCRIPTION="A new user interface protocol and toolkit implementation"
HOMEPAGE="https://github.com/Shirakumo/alloy"
SRC_URI="https://github.com/Shirakumo/alloy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/array-utils
	dev-lisp/closer-mop
"
BDEPEND=""
