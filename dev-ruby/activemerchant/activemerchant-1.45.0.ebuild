# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Active Merchant is a simple payment abstraction library used in and sponsored by Shopify"
HOMEPAGE="http://activemerchant.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2.14"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.9"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend ">=dev-ruby/active_utils-2.2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4"
ruby_add_rdepend ">=dev-ruby/offsite_payments-2.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.0"
ruby_add_rdepend ">=dev-ruby/rails-3.2.14"
ruby_add_rdepend ">=dev-ruby/thor-0"

