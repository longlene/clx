# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Implement texter classes for sending SMS messages in similar way to how e-mails are sent with ActionMailer-based mailers"
HOMEPAGE="http://github.com/visualitypl/textris"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-sidekiq-2.0"
ruby_add_rdepend ">=dev-ruby/scrutinizer-ocular-1.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/twilio-ruby-3.12"
ruby_add_rdepend ">=dev-ruby/nexmo-2.0"
ruby_add_rdepend ">=dev-ruby/actionmailer-4.0"
ruby_add_rdepend ">=dev-ruby/activejob-4.2"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/phony-2.8"
ruby_add_rdepend ">=dev-ruby/render_anywhere-0.0"

