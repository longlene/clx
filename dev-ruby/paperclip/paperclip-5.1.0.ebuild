# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Easy upload management for ActiveRecord"
HOMEPAGE="https://github.com/thoughtbot/paperclip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2.0"
ruby_add_rdepend ">=dev-ruby/cocaine-0.5.5"
ruby_add_rdepend ">=dev-ruby/mime-types-0"
ruby_add_rdepend ">=dev-ruby/mimemagic-0.3.0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2.0"
ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/aws-sdk-2.0.34"
ruby_add_rdepend ">=dev-ruby/bourne-0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3.18"
ruby_add_rdepend ">=dev-ruby/aruba-0.9.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/fog-aws-0"
ruby_add_rdepend ">=dev-ruby/fog-local-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/fakeweb-0"
ruby_add_rdepend ">=dev-ruby/railties-0"
ruby_add_rdepend ">=dev-ruby/actionmailer-4.2.0"
ruby_add_rdepend ">=dev-ruby/generator_spec-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"

