# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="DataMapper adapter for Riak"
HOMEPAGE="http://github.com/mikeric/dm-riak-adapter"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.0.0"
ruby_add_rdepend ">=dev-ruby/riak-client-0.8.0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

