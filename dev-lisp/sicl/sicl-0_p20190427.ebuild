# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cd7d419f61ad73b7979c80667f3563e5a5206a82"

DESCRIPTION="A fresh implementation of Common Lisp"
HOMEPAGE="https://github.com/robert-strandh/SICL"
SRC_URI="https://github.com/robert-strandh/SICL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
