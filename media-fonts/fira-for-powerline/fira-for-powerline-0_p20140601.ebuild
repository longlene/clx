# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit font vcs-snapshot

EGIT_COMMIT="d2929d4513736f52b548273234d4e905d239edb2"

DESCRIPTION="Fira Mono with Powerline symbols patched in"
HOMEPAGE="https://github.com/colepeters/fira-for-powerline"
SRC_URI="https://github.com/colepeters/fira-for-powerline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND=""

FONT_SUFFIX="otf"
