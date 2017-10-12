# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c28a57d31e0f7f9b1d6c9952be98df0fe1dec571"

DESCRIPTION="Decimal number parser and formatter package for the Common Lisp language"
HOMEPAGE="https://github.com/tlikonen/cl-decimals"
SRC_URI="https://github.com/tlikonen/cl-decimals/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
