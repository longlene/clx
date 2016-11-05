# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="xcessive macro that generates decision trees for small sets of strings"
HOMEPAGE="https://github.com/pkhuong/string-case"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pkhuong/string-case.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
