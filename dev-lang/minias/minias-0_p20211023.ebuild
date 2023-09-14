# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="cd21b90feaa9b66296b8614023349fae7d314b4b"

DESCRIPTION="A mini x86-64 assembler"
HOMEPAGE="https://github.com/andrewchambers/minias"
SRC_URI="https://github.com/andrewchambers/minias/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/peg
"
RDEPEND="${DEPEND}"
BDEPEND=""
