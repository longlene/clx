# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="Assemble boot images for the Android bootloader"
SRC_URI=""
HOMEPAGE="http://android.git.kernel.org/?p=platform/system/core.git;a=summary"
KEYWORDS="~arm"
SLOT="0"
LICENSE="Apache-2.0 BSD"
IUSE=""
DEPEND="sys-devel/gcc"

EGIT_REPO_URI="git://android.git.kernel.org/platform/system/core.git"

src_compile () {
    # The Android.mk files do not seem to help us much...
    gcc -Os {libmincrypt,mkbootimg}/*.c -Iinclude -o mkbootimg/mkbootimg
}

src_install() {
    dobin mkbootimg/mkbootimg
}
