# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8100eaecb32cd438c19886c9026088f39cdfa81b"

DESCRIPTION="Dynamic library delivery tools for SBCL"
HOMEPAGE="https://github.com/quil-lang/sbcl-librarian"
SRC_URI="https://github.com/quil-lang/sbcl-librarian/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
