# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp interface to Music Player Daemon"
HOMEPAGE="https://github.com/stassats/mpd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stassats/mpd.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/usocket"
