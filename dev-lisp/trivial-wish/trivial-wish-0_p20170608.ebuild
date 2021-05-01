# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="910afeeab410ae93346b282f4604502789d0f527"

DESCRIPTION="A wish is a request for a later computation"
HOMEPAGE="https://github.com/stacksmith/trivial-wish/"
SRC_URI="https://github.com/stacksmith/trivial-wish/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
