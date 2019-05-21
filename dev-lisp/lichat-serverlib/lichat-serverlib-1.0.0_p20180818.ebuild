# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d2185bbbca92d3bd56f0ae8513a88988abc62b7d"

DESCRIPTION="Tools to help build a conforming server for the Lichat chat protocol"
HOMEPAGE="https://github.com/Shirakumo/lichat-serverlib"
SRC_URI="https://github.com/Shirakumo/lichat-serverlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lichat-protocol
	dev-lisp/crypto-shortcuts
	dev-lisp/trivial-mimes
	dev-lisp/documentation-utils
"
BDEPEND=""
