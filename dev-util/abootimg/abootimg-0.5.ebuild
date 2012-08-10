# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
EGIT_REPO_URI="git://gitorious.org/ac100/abootimg.git"
EGIT_COMMIT="v$PV"
DESCRIPTION="Manipulate boot images for the Android bootloader"
SRC_URI=""
HOMEPAGE="http://android.git.kernel.org/?p=platform/system/core.git;a=summary"
KEYWORDS="arm"
SLOT="0"
LICENSE="GPL-2"
IUSE=""
DEPEND="sys-devel/gcc"

inherit git-2

src_compile () {
    make || die 'make failed.'
}

src_install() {
    dobin abootimg
}
