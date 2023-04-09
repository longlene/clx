# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5264600245d935062e12dce9ff7b642cefc304eb"

DESCRIPTION="Persistent data structures in Common Lisp"
HOMEPAGE="https://github.com/gefjon/immutable"
SRC_URI="https://github.com/gefjon/immutable/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
