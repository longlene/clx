# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A library providing a universal application configuration mechanism"
HOMEPAGE="https://shinmera.github.io/ubiquitous"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/ubiquitous.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
