# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a4baa05e72ee05aba545152a2ffe2e46fbfa3d4b"

DESCRIPTION="Secure Hash Algorithm 3 (Keccak) Implementation in Common Lisp"
HOMEPAGE="https://github.com/pmai/sha3"
SRC_URI="https://github.com/pmai/sha3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
