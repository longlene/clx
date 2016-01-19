# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp Machine Learning Library"
HOMEPAGE="https://github.com/mmaul/clml"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/mmaul/clml.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/array-operations
	dev-lisp/introspect-environment
	dev-lisp/iterate
	dev-lisp/lparallel
	dev-lisp/parse-number
"
