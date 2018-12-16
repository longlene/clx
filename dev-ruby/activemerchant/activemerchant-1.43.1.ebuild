# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

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

ruby_add_rdepend ">=dev-ruby/i18n-0.5"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend "dev-ruby/money"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4"

