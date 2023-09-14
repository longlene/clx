# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4bcb674d4faba36cdc842009453b889962b1375f"

DESCRIPTION="CL type system implementation"
HOMEPAGE="https://github.com/s-expressionists/ctype"
SRC_URI="https://github.com/s-expressionists/ctype/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
