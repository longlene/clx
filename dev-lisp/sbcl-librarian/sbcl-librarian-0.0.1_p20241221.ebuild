# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c1d357952179fea15d6c4802c59bef1c79267fb3"

DESCRIPTION="Dynamic library delivery tools for SBCL"
HOMEPAGE="https://github.com/quil-lang/sbcl-librarian"
SRC_URI="https://github.com/quil-lang/sbcl-librarian/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
