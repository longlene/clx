# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit python-any-r1

DESCRIPTION="V8 JavaScript Engine"
HOMEPAGE="https://v8.dev"
SRC_URI="https://github.com/v8/v8/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	case ${CHOST} in
		i?86-*)
			myarch="ia32" ;;
		x86_64-*)
			if [[ $ABI = x86 ]] ; then
				myarch="ia32"
			else
				myarch="x64"
			fi ;;
		arm*-*)
			myarch="arm" ;;
		*) die "Unrecognized CHOST: ${CHOST}"
	esac
	./tools/dev/v8gen.py ${myarch}.release || die "configure failed"
}

src_compile() {
	ninja -C out.gn/x64.release || die "compile failed"
}
