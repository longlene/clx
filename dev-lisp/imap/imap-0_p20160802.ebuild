# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7fb40cb5e093083840a32068a6e4d4ba94bc9f22"

DESCRIPTION="POP, IMAP and SMTP client support for Common Lisp"
HOMEPAGE="https://github.com/franzinc/imap"
SRC_URI="https://github.com/franzinc/imap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
