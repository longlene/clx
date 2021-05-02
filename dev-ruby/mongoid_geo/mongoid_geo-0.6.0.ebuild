# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Makes it easy to use geo calculations with Mongoid"
HOMEPAGE="http://github.com/kristianmandrup/mongoid_geo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">dev-ruby/mongoid-2"
ruby_add_rdepend ">=dev-ruby/bson-1.3"
ruby_add_rdepend ">dev-ruby/activesupport-3"
ruby_add_rdepend ">=dev-ruby/hashie-0.4.0"
ruby_add_rdepend ">dev-ruby/rspec-2.4"
ruby_add_rdepend ">dev-ruby/bundler-1"
ruby_add_rdepend ">dev-ruby/jeweler-1.5"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">dev-ruby/mongoid-2"
ruby_add_rdepend ">=dev-ruby/bson-1.3"
ruby_add_rdepend ">dev-ruby/activesupport-3"
ruby_add_rdepend ">=dev-ruby/hashie-0.4.0"
ruby_add_rdepend ">dev-ruby/rspec-2.4"

