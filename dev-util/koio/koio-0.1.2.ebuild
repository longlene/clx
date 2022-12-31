# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A tool & library for embedding files into C programs"
HOMEPAGE="https://git.sr.ht/~sircmpwn/koio"
SRC_URI="https://git.sr.ht/~sircmpwn/koio/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
