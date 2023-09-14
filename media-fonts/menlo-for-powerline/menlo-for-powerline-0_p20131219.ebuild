# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font vcs-snapshot

EGIT_COMMIT="07e91f66786b3755d99dcfe52b436cf1c2355f38"

DESCRIPTION="Menlo font patched to work with Powerline"
HOMEPAGE="https://github.com/abertsch/Menlo-for-Powerline"
SRC_URI="https://github.com/abertsch/Menlo-for-Powerline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND=""

FONT_SUFFIX="ttf"
