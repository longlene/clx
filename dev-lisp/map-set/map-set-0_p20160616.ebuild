# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7b4b545b68b8309ce2bc1354357dc97e29533c65"

DESCRIPTION="Set-like data structure using maps"
HOMEPAGE="https://bitbucket.org/tarballs_are_good/map-set"
SRC_URI="https://bitbucket.org/tarballs_are_good/map-set/get/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
