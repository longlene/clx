# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A common lisp library for simply implementing programs using cellular automata"
HOMEPAGE="https://github.com/lukasepple/cl-ca/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lukasepple/cl-ca.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
