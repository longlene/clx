# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Convenience layer on top of commonqt"
HOMEPAGE="https://github.com/stassats/qt-ui"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stassats/qt-ui.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/commonqt
dev-lisp/drakma"
