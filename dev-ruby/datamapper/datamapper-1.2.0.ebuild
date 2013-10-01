# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-fakegem

DESCRIPTION="An ORM fast, thread-safe and feature rich."
HOMEPAGE="http://datamapper.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="dev"

ruby_add_rdepend "=dev-ruby/dm-core-1.2.0
	=dev-ruby/dm-aggregates-1.2.0
	=dev-ruby/dm-constraints-1.2.0
	=dev-ruby/dm-migrations-1.2.0
	=dev-ruby/dm-transactions-1.2.0
	=dev-ruby/dm-serializer-1.2.0
	=dev-ruby/dm-timestamps-1.2.0
	=dev-ruby/dm-validations-1.2.0
	=dev-ruby/dm-types-1.2.0"

ruby_add_bdepend "dev? ( >=dev-ruby/hoe-2.6.1
		   >=dev-ruby/rubyforge-2.0.4 )"
