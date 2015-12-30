# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="We have extracted out the logic from IdleCampus and built xmppify because I want to help anyone built a real time communication platform or a product as soon as possible"
HOMEPAGE="https://github.com/charlieanna/xmppify"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/angularjs-rails-0"
ruby_add_rdepend ">=dev-ruby/devise-0"
ruby_add_rdepend ">=dev-ruby/gon-0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/hpricot-0"
ruby_add_rdepend ">=dev-ruby/omniauth-0"
ruby_add_rdepend ">=dev-ruby/omniauth-oauth2-0"
ruby_add_rdepend ">=dev-ruby/doorkeeper-0"
ruby_add_rdepend ">=dev-ruby/xmpp4r-0.5.5"
ruby_add_rdepend ">=dev-ruby/dotenv-rails-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-2.5.0"
ruby_add_rdepend ">=dev-ruby/spork-rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/guard-spork-1.5.0"
ruby_add_rdepend ">=dev-ruby/childprocess-0"
ruby_add_rdepend ">=dev-ruby/factory_girl_rails-0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.2.0"
ruby_add_rdepend ">=dev-ruby/high_voltage-2.1.0"
ruby_add_rdepend ">=dev-ruby/poltergeist-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"

