# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The goal of this project is to provide ORM for Redis that feels very similar to ActiveRecord"
HOMEPAGE="http://github.com/sinisterchipmunk/redis-orm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.18"
ruby_add_rdepend ">=dev-ruby/redis-2.2.2"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0.10"

