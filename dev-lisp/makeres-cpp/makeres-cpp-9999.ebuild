# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="makeres table transformations for generating and compiling C++ programs for efficient computation"
HOMEPAGE="https://github.com/ghollisjr/makeres-cpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ghollisjr/makeres-cpp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ana
	dev-lisp/external-program
	dev-lisp/alexandria
"
