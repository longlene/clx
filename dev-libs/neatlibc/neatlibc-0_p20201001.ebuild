# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="1255949b94e0eb999f2e9c29efe1df60ea951a03"

DESCRIPTION="A small libc"
HOMEPAGE="http://litcave.rudi.ir"
SRC_URI="http://github.com/aligrudi/neatlibc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sys-devel/neatcc
	amd64? ( dev-lang/fasm )
	x86? ( dev-lang/fasm )
	arm? ( sys-devel/neatas )
"
RDEPEND="${DEPEND}"

src_install() {
	# conflict with standard libc
	insinto /usr/include
	doins -r arpa ctype.h dirent.h elf.h errno.h fcntl.h inttypes.h poll.h regex.h setjmp.h signal.h stdarg.h stddef.h stdint.h stdio.h stdlib.h string.h termios.h time.h unistd.h utime.h sys linux
	dolib.a libc.a
	dodoc README
}
