# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="quark web server"
HOMEPAGE="http://git.suckless.org/quark/"
SRC_URI=""

EGIT_REPO_URI="git://git.suckless.org/quark"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/PREFIX =/ s#/local##' config.mk
}
