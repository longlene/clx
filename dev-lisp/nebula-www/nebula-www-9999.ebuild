# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="HTTP frontend for Nebula"
HOMEPAGE="https://github.com/kisom/cl-nebula-www"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kisom/cl-nebula-www.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/nebula
"
