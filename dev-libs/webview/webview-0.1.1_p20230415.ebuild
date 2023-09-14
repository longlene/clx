# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="8387ff8945fc010e7c4203c021943ce4ca12a276"

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
