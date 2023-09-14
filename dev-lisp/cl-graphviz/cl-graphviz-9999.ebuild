# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp CFFI-based interface to graphviz."
HOMEPAGE="http://common-lisp.net/project/cl-graphviz/ https://github.com/necto/cl-graphviz"
SRC_URI=""

EGIT_REPO_URI="git@github.com:necto/cl-graphviz.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="media-gfx/graphviz
		dev-lisp/cffi
		dev-lisp/metabang-bind"
