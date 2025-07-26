# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f15623acb31676d0b41187da68375ae4aedab108"

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
