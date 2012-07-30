# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit java-pkg-2 java-ant-2 multilib

MY_P=${P/-/_}

DESCRIPTION="An integration of Eclipse into Vim"
HOMEPAGE="http://eclim.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-util/eclipse-sdk:3.4
	>=dev-java/tagsoup-1.2"
#	>=dev-java/nailgun-0.7.1"
DEPEND="${COMMON_DEPEND}
	>=virtual/jdk-1.5
	test? ( >=dev-java/junit-4.1:4 )"
RDEPEND="${COMMON_DEPEND}
	|| ( app-editors/vim app-editors/gvim )
	>=virtual/jre-1.5"

S=${WORKDIR}/${MY_P}
EANT_EXTRA_ARGS="-Declipse.home=/usr/$(get_libdir)/eclipse-3.4
-Dplugins=jdt,ant,maven -Declim.installto=${D}
-Dvim.files=${D}/usr/share/vim/vimfiles"
EANT_BUILD_TARGET="build"

src_unpack() {
	unpack ${A}
	cd "${S}"

	#epatch "${FILESDIR}"/${P}-buildxmlfixes.patch
	#Remove bundled jars
#	rm lib/junit* lib/testng*
}

src_install() {
	eant ${EANT_EXTRA_ARGS} deploy
}
