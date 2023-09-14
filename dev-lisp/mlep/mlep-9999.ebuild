# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="cl-mlep is a Common Lisp Machine Learning library for Educational Purposes"
HOMEPAGE="https://github.com/fzalkow/cl-mlep"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fzalkow/cl-mlep.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/lla
	dev-lisp/cl-num-utils
"
