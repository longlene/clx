# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0967cf3e1b4d0574fb43996224e569a2986fd8a5"

DESCRIPTION="Dynamic library delivery tools for SBCL"
HOMEPAGE="https://github.com/quil-lang/sbcl-librarian"
SRC_URI="https://github.com/quil-lang/sbcl-librarian/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
