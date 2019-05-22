# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A small daemon for running programs via UNIX socket"
HOMEPAGE="https://github.com/jprjr/sockexec"
SRC_URI="https://github.com/jprjr/sockexec/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/skalibs
"
