# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="META syntax to easily write parsers"
HOMEPAGE="https://gitlab.common-lisp.net/frideau/meta"
SRC_URI="https://gitlab.common-lisp.net/frideau/meta/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
BDEPEND=""
