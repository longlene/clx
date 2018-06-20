# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="02aa1dcf62a15f2c1e2197a07642e9c474ac32fa"

DESCRIPTION="Tiny cross-platform webview library for C/C++/Golang"
HOMEPAGE="https://github.com/zserge/webview"
SRC_URI="https://github.com/zserge/webview/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/webkit-gtk:4
"
RDEPEND="${DEPEND}"
