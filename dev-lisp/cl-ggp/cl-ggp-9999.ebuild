# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 mercurial

DESCRIPTION="A framework for writing General Game Playing clients"
HOMEPAGE="https://bitbucket.org/sjl/cl-ggp/"
SRC_URI=""

EHG_REPO_URI="https://bitbucket.org/sjl/cl-ggp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/flexi-streams
	dev-lisp/optima
	dev-lisp/fare-quasiquote-optima
	dev-lisp/fare-quasiquote-readtable
"
