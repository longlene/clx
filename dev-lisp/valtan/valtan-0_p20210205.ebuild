# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec3164d42b86869357dc185b747c5dfba25c0a3c"

DESCRIPTION="Common Lisp to JavaScript compiler"
HOMEPAGE="https://github.com/cxxxr/valtan"
SRC_URI="https://github.com/cxxxr/valtan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
