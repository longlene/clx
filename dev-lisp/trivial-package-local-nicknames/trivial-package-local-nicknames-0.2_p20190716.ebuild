# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a3c5e3bd87d227d94975c89bda0ef033a21b3326"

DESCRIPTION="Common Lisp PLN compatibility library"
HOMEPAGE="https://github.com/phoe/trivial-package-local-nicknames/"
SRC_URI="https://github.com/phoe/trivial-package-local-nicknames/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
