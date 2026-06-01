# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit perl-module

DESCRIPTION="Fingerprinting DNS servers"
HOMEPAGE="http://code.google.com/p/fpdns/"

MY_P="Net-DNS-Fingerprint-${PV}"
SRC_URI="http://fpdns.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
S="${WORKDIR}"/"${MY_P}"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-perl/Net-DNS-0.42"

src_install() {
	newbin apps/fpdns fpdns
	insinto "${VENDOR_LIB}"/Net/DNS/
	doins Fingerprint.pm || die
}
