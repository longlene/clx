# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="Ruby-Feedparser is an RSS and Atom parser for Ruby. It was initially developed for Feed2Imap, but it is now a standalone library."
SRC_URI="http://download.gna.org/ruby-feedparser/${P}.tgz"
HOMEPAGE="http://home.gna.org/ruby-feedparser/"

IUSE=""

DEPEND="dev-ruby/rubymail"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~ppc ~x86"

