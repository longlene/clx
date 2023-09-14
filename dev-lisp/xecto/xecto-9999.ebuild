# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Xecto is a simple parallel vector-processing library"
HOMEPAGE="https://github.com/pkhuong/Xecto"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pkhuong/Xecto.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-lisp/sbcl"
RDEPEND="${DEPEND}"
