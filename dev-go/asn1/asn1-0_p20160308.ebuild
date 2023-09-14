# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/PromonLogicalis/asn1"
EGIT_COMMIT="c9c836c1a3cd4b4696c1adf57ab887c36fc06fae"

DESCRIPTION="ASN.1 BER and DER encoding library for golang"
HOMEPAGE="https://github.com/PromonLogicalis/asn1"
SRC_URI="https://github.com/PromonLogicalis/asn1/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
