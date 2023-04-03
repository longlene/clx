# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Draper adds an object-oriented layer of presentation logic to your Rails apps"
HOMEPAGE="http://github.com/drapergem/draper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-5.0"
ruby_add_rdepend ">=dev-ruby/actionpack-5.0"
ruby_add_rdepend ">=dev-ruby/request_store-1.0"
ruby_add_rdepend ">=dev-ruby/activemodel-5.0"
ruby_add_rdepend ">=dev-ruby/activemodel-serializers-xml-1.0"
ruby_add_rdepend ">=dev-ruby/ammeter-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/minitest-rails-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/active_model_serializers-0.10"
ruby_add_rdepend ">=dev-ruby/rubocop-0"

