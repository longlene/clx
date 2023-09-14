# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8a4d09c1c5cb2b5349aecbd796164433df7a6cc5"

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
