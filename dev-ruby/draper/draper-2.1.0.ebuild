# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Draper adds an object-oriented layer of presentation logic to your Rails apps"
HOMEPAGE="http://github.com/drapergem/draper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/request_store-1.0"
ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/ammeter-0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.2"
ruby_add_rdepend ">=dev-ruby/minitest-rails-1.0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/active_model_serializers-0"

