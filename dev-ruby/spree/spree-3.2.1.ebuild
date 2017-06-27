# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Spree is an open source e-commerce framework for Ruby on Rails"
HOMEPAGE="http://spreecommerce.com"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/spree_core-3.2.1"
ruby_add_rdepend "=dev-ruby/spree_api-3.2.1"
ruby_add_rdepend "=dev-ruby/spree_backend-3.2.1"
ruby_add_rdepend "=dev-ruby/spree_frontend-3.2.1"
ruby_add_rdepend "=dev-ruby/spree_sample-3.2.1"
ruby_add_rdepend "=dev-ruby/spree_cmd-3.2.1"
