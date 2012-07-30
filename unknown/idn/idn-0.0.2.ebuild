# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.4.3.ebuild,v 1.1 2007/01/06 14:15:08 graaff Exp $

inherit gems

DESCRIPTION="Ruby Bindings for the GNU LibIDN library - featuring the most
important bits of all LibIDN APIs like performing Stringprep processings,
encoding to and decoding from Punycode strings and converting entire domain
names to and from the ACE encoded form."
HOMEPAGE="http://rubyforge.org/projects/idn/"
LICENSE="Apache"

KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
SLOT="0"
IUSE=""

DEPEND="net-dns/libidn"
