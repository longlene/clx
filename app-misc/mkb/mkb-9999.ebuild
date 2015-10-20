# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="progress bar maker"
HOMEPAGE="http://git.2f30.org/mkb/"
SRC_URI=""

EGIT_REPO_URI="git://git.2f30.org/mkb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX:=/ s#/local##' Makefile
}
