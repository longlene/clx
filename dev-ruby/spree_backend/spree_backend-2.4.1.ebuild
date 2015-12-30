# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Required dependency for Spree"
HOMEPAGE="http://spreecommerce.com"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/spree_api-2.4.1"
ruby_add_rdepend "=dev-ruby/spree_core-2.4.1"
ruby_add_rdepend ">=dev-ruby/jquery-rails-3.1.2"
ruby_add_rdepend ">=dev-ruby/jquery-ui-rails-5.0.0"
ruby_add_rdepend ">=dev-ruby/select2-rails-3.5.0"

