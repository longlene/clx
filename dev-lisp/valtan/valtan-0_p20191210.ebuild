# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d58a80a91377fb3f14bf29d86bb586a4ab541432"

DESCRIPTION="Common Lisp to JavaScript compiler"
HOMEPAGE="https://github.com/cxxxr/valtan"
SRC_URI="https://github.com/cxxxr/valtan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
