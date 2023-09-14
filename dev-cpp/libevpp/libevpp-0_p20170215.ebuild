# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="a6e3081208e96233e9de30a3fbe9198a63a8ed48"

DESCRIPTION="An ASIO-like library for evented IO based on libEV for *nix systems"
HOMEPAGE="https://github.com/hamidr/libevpp"
SRC_URI="https://github.com/hamidr/libevpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a ${BUILD_DIR}/lib{event_loop,network}.a 
	insinto /usr
	doins -r includes/libevpp
	dodoc README.md
}
