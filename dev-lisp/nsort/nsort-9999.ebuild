# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Natural or Numeric Sort"
HOMEPAGE="https://github.com/jschatzer/nsort"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jschatzer/nsort.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/prove
"
