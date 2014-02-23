# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_TASK_DOC="yard"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem versionator

DESCRIPTION="DataMapper plugin providing support for aggregates on collections"
HOMEPAGE="http://datamapper.org/"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/jeweler >=dev-ruby/yard-0.8.7 )"
ruby_add_bdepend "test? (
	dev-ruby/dm-migrations:1.2
	dev-ruby/jeweler
	dev-ruby/rspec:0 )"

ruby_add_rdepend "dev-ruby/dm-core:1.2"

all_ruby_prepare() {
	sed -i -e "s/gem 'jeweler'/#gem 'jeweler'/g" Rakefile || die
}
