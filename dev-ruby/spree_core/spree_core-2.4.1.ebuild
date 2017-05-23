# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The bare bones necessary for Spree"
HOMEPAGE="http://spreecommerce.com"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemerchant-1.44.1"
ruby_add_rdepend ">=dev-ruby/acts_as_list-0.3.0"
ruby_add_rdepend ">=dev-ruby/awesome_nested_set-3.0.1"
ruby_add_rdepend ">=dev-ruby/carmen-1.0.0"
ruby_add_rdepend ">=dev-ruby/cancancan-1.9.2"
ruby_add_rdepend ">=dev-ruby/deface-1.0.0"
ruby_add_rdepend ">=dev-ruby/ffaker-1.16"
ruby_add_rdepend ">=dev-ruby/font-awesome-rails-4.0"
ruby_add_rdepend ">=dev-ruby/friendly_id-5.0.4"
ruby_add_rdepend ">=dev-ruby/highline-1.6.18"
ruby_add_rdepend ">=dev-ruby/httparty-0.11"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend ">=dev-ruby/kaminari-0.15"
ruby_add_rdepend ">=dev-ruby/monetize-0"
ruby_add_rdepend ">=dev-ruby/paperclip-4.2.0"
ruby_add_rdepend ">=dev-ruby/paranoia-2.0"
ruby_add_rdepend ">=dev-ruby/premailer-rails-0"
ruby_add_rdepend ">=dev-ruby/rails-4.1.8"
ruby_add_rdepend ">=dev-ruby/ransack-1.4.1"
ruby_add_rdepend ">=dev-ruby/state_machine-1.2.0"
ruby_add_rdepend ">=dev-ruby/stringex-1.5.1"
ruby_add_rdepend ">=dev-ruby/truncate_html-0.9.2"
ruby_add_rdepend ">=dev-ruby/twitter_cldr-3.0"
ruby_add_rdepend ">=dev-ruby/email_spec-1.6"

