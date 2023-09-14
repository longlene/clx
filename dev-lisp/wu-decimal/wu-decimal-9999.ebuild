# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A Decimal Package for Lisp"
HOMEPAGE="https://wukix.com/lisp-decimal"
SRC_URI=""

EGIT_REPO_URI="http://wukix.com/dist/wu-decimal.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
