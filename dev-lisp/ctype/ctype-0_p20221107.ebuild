# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b62480f412935fefed5ec9bc11158de8d8e29e96"

DESCRIPTION="CL type system implementation"
HOMEPAGE="https://github.com/s-expressionists/ctype"
SRC_URI="https://github.com/s-expressionists/ctype/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
