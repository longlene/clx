# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils multilib toolchain-funcs

DESCRIPTION="newLISP - a new generation of Lisp!"
HOMEPAGE="http://www.newlisp.org/"
SRC_URI="http://www.newlisp.org/downloads/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libffi unicode"

RDEPEND="sys-libs/readline:=
	libffi? ( dev-libs/libffi )"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-fix-makefiles.patch"
	"${FILESDIR}/${P}-fix-paths.patch"
)

getmakefile() {
	local arch=""
	local opts=""

	use amd64 && arch="LP64"
	use libffi && use unicode && opts="_utf8_ffi"
	use libffi && ! use unicode && opts="_ffi"
	! use libffi && use unicode && opts="_utf8"

	use unicode && utf8="utf8"
	echo "makefile_linux${arch}${opts}"
}

getlibffipath() {
	local version=$(best_version dev-libs/libffi)

	version=$(echo ${version} | cut -d/ -f 2)
	echo "/usr/$(get_libdir)/${version}"
}

src_configure() {
	local makefile=$(getmakefile)
	if [[ -f ${makefile} ]] ; then
		cp "${makefile}" makefile_build || die
		sed -i 's/CFLAGS/MYCFLAGS/g' makefile_build || die
		sed -i 's/-O2 -g/$(CFLAGS)/g' makefile_build || die
		sed -i '/strip newlisp/d' makefile_build || die
	else
		./configure-alt --prefix="${D}/usr"
		sed -i '/$(STRIP) $(TARG)/d' makefile_build || die
	fi
	if use libffi ; then
		sed -i "s|/usr/local/lib/libffi-3.0.13|$(getlibffipath)|" makefile_build || die
	fi
}

src_compile() {
	emake CC=$(tc-getCC)
}
src_install() {
	make prefix="${D}/usr" install
}
