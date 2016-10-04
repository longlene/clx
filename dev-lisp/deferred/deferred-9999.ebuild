# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A simple library allowing you to write code using deferred libraries"
HOMEPAGE="https://github.com/Shinmera/deferred/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/deferred.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
