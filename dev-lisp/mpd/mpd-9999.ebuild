# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp interface to Music Player Daemon"
HOMEPAGE="https://github.com/stassats/mpd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stassats/mpd.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/usocket"
