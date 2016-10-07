# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Tiny Common Lisp library to do some quick benchmark tests"
HOMEPAGE="http://shinmera.github.io/trivial-benchmark/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/trivial-benchmark.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
