# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit perl-module

DESCRIPTION="Fingerprinting DNS servers"
HOMEPAGE="http://code.google.com/p/fpdns/"

MY_P="Net-DNS-Fingerprint-${PV}"
SRC_URI="http://fpdns.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-perl/Net-DNS-0.42"

S="${WORKDIR}"/"${MY_P}"

src_install() {
	newbin apps/fpdns fpdns
	insinto "${VENDOR_LIB}"/Net/DNS/
	doins Fingerprint.pm || die
}
