# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cucumber Generator and Runtime for Rails"
HOMEPAGE="http://cukes.info"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/capybara-1.1.2"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.8"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"
ruby_add_rdepend ">=dev-ruby/rails-3"
ruby_add_rdepend ">=dev-ruby/mime-types-1.16"
ruby_add_rdepend ">=dev-ruby/ammeter-0.2.9"
ruby_add_rdepend ">=dev-ruby/appraisal-0.5.1"
ruby_add_rdepend ">=dev-ruby/aruba-0.4.11"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.3.5"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0.7.2"
ruby_add_rdepend ">=dev-ruby/factory_girl-3.2"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.2"
ruby_add_rdepend ">=dev-ruby/bcat-0.6.2"
ruby_add_rdepend ">=dev-ruby/rdiscount-2.0.7"
ruby_add_rdepend ">=dev-ruby/rdoc-3.4"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"

