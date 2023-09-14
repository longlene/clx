# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ed473e220133ca0e8b5b96618ea2972dec9de6cd"

DESCRIPTION="A Common Lisp implementation of Bse64 Encoding/Decoding."
HOMEPAGE="http://homepage.mac.com/svc/s-base64/"
SRC_URI="https://github.com/svenvc/s-base64/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

