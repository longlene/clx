# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp interface to Music Player Daemon"
HOMEPAGE="https://github.com/stassats/mpd"

EGIT_REPO_URI="https://github.com/stassats/mpd.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/usocket"
