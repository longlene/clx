# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89e66963f7c6ae3a273009745b857201c102d226"

DESCRIPTION="An implementation of microKanren in Common Lisp"
HOMEPAGE="https://github.com/rgc69/si-kanren/"
SRC_URI="https://github.com/rgc69/si-kanren/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
