# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp bindings for ODE"
HOMEPAGE="https://github.com/orthecreedence/cl-ode"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-ode.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-games/ode
"
