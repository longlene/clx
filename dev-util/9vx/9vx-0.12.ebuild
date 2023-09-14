# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License

EAPI=8

DESCRIPTION="9vx is a port of the plan 9 operating system to freebsd, linux, and os x, using the vx32 sandboxing library to run user programs. "
HOMEPAGE="http://swtch.com/9vx/"
LICENSE="Lucent"
SLOT="0"
KEYWORDS="~x86 ~amd64"
SRC_URI="http://pdos.csail.mit.edu/~rsc/${P}.tar.bz2"

src_install() {
	mv 9vx.Linux 9vx
	dobin 9vx
}
