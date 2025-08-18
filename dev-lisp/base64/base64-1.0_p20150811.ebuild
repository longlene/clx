# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d0d0f0972b0efa6ed2b8f13f277543eb9860623a"

DESCRIPTION="Base64 encoding and decoding for Common Lisp"
HOMEPAGE="https://github.com/massung/base64"
SRC_URI="https://github.com/massung/base64/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
