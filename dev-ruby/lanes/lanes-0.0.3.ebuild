# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Lanes is a framework for writing single page web applications"
HOMEPAGE="http://argosity.com/lanes/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.1"
ruby_add_rdepend ">=dev-ruby/pg-0.17"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.1"
ruby_add_rdepend ">=dev-ruby/oj-2.1"
ruby_add_rdepend ">=dev-ruby/message_bus-1.0"
ruby_add_rdepend ">=dev-ruby/rack_csrf-2.5"
ruby_add_rdepend ">=dev-ruby/sprockets-2.0"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.3"
ruby_add_rdepend ">=dev-ruby/execjs-2.2"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.1"
ruby_add_rdepend ">=dev-ruby/guard-2.0"
ruby_add_rdepend ">=dev-ruby/hashie-3.3"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/minitest-around-0.2"
ruby_add_rdepend ">=dev-ruby/guard-minitest-2.3"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/jasmine-core-2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/growl-1.0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-2.0"

