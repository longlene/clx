# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Computer graphics algebra library for SBCL"
HOMEPAGE="http://nikodemus.github.com/sb-cga/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nikodemus/sb-cga.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/madeira-port
"
