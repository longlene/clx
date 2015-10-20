# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib git-2

DESCRIPTION="tiny threading library for linux"
HOMEPAGE="http://git.2f30.org/tinythread/"
SRC_URI=""

EGIT_REPO_URI="git://git.2f30.org/tinythread"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX/ s#/local##' config.mk
	sed -i "s#/lib#/$(get_libdir)#" Makefile
} 

