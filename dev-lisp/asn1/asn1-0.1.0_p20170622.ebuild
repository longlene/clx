# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1facb31c4a104637067eb9b63978b86fa65dd1a6"

DESCRIPTION="ASN.1 decoder"
HOMEPAGE="https://github.com/fukamachi/asn1"
SRC_URI="https://github.com/fukamachi/asn1/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
