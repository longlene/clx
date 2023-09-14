# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="A C library for product recommendations/suggestions using collaborative filtering"
HOMEPAGE="https://github.com/GHamrouni/Recommender"
SRC_URI=""

EGIT_REPO_URI="https://github.com/GHamrouni/Recommender.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/CFLAGS=/{s#CFLAGS=#CFLAGS:=#}' src/Makefile
	sed -i '/OBJECTS/{s#hiredis/libhiredis.a##}' tools/serialization/makefile
	sed -i 's#-Werror##' tools/kfold/makefile
}

src_install() {
	dolib.a src/libRecommender.a
	insinto /usr/include
	dodoc README.md
}
