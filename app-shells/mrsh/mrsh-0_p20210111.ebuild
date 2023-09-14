# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="9f9884083831ea1f94bdda5151c5df3888932849"

DESCRIPTION="A minimal POSIX shell"
HOMEPAGE="https://github.com/emersion/mrsh"
SRC_URI="https://github.com/emersion/mrsh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
