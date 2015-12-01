# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base autotools git

DESCRIPTION="freesmartphone.org DBus XML specification & documentation"
HOMEPAGE="http://www.freesmartphone.org"
EGIT_REPO_URI="git://git.freesmartphone.org/specs.git"
EGIT_PROJECT="fso-specs"
EGIT_COMMIT="8d71cde1377deaecb67d8081060ddddb441b5186"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""

src_prepare()
{
	eautoreconf
}
