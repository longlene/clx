# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby25 ruby26 ruby25"

inherit ruby-fakegem

DESCRIPTION="A library for viewing and manipulating Mach-O files in Ruby"
HOMEPAGE="https://github.com/Homebrew/ruby-macho"
SRC_URI="mirror://rubygems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
