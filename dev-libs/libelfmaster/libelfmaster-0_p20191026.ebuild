# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="f7b1dda48a37ffd16129c68e219b7269563ef462"

DESCRIPTION="Secure ELF parsing/loading library"
HOMEPAGE="https://github.com/elfmaster/libelfmaster"
SRC_URI="https://github.com/elfmaster/libelfmaster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
