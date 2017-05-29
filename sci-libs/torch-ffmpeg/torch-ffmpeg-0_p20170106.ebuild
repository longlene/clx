# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="d185f87d5cb2ff8ce3023edf627b6f604e1d8671"

DESCRIPTION="ffmpeg in torch that is simple and easy to install"
HOMEPAGE="https://github.com/cvondrick/torch-ffmpeg"
SRC_URI="https://github.com/cvondrick/torch-ffmpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-video/ffmpeg
"

src_install() {
	lua_install_module torch-ffmpeg.lua
	dodoc README.md
}
