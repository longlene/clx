# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Standard library package seperation for symbols in Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/libcl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/libcl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
