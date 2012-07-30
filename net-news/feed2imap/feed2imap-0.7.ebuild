# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="Feed2Imap - Feed2Imap is an RSS/Atom aggregator that upload items to an IMAP server."
SRC_URI="http://download.gna.org/feed2imap/${P}.tgz"
HOMEPAGE="http://home.gna.org/feed2imap/"

IUSE=""

DEPEND="dev-ruby/ruby-feedparser"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~ppc ~x86"

