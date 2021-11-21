# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="38e9ffbdb2c894670c366c1e5802ffcc8cfd43a7"

DESCRIPTION="A Common Lisp macro for defining temporary caches"
HOMEPAGE="https://github.com/charje/cache-while/"
SRC_URI="https://github.com/charje/cache-while/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
