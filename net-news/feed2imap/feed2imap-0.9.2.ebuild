# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="RSS/Atom feed aggregator which uploads feeds to an IMAP server"
HOMEPAGE="http://home.gna.org/feed2imap/"
SRC_URI="http://download.gna.org/${PN}/${P}.tgz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-ruby/ruby-feedparser
		dev-ruby/rubymail"
RDEPEND="${DEPEND}"

src_install() {
	${RUBY} setup.rb install --prefix=${D} "$@" \
	${RUBY_ECONF} || die "setup.rb install failed"

	cd "${S}"
	dodoc ChangeLog README
}
