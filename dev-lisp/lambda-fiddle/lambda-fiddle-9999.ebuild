# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A collection of utilities to process lambda-lists"
HOMEPAGE="http://shinmera.github.io/lambda-fiddle"
SRC_URI=""

EGIT_REPO_URI="http://github.com/Shinmera/lambda-fiddle.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
