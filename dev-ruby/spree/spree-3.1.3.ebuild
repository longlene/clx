# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Spree is an open source e-commerce framework for Ruby on Rails"
HOMEPAGE="http://spreecommerce.com"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/spree_core-3.1.3"
ruby_add_rdepend "=dev-ruby/spree_api-3.1.3"
ruby_add_rdepend "=dev-ruby/spree_backend-3.1.3"
ruby_add_rdepend "=dev-ruby/spree_frontend-3.1.3"
ruby_add_rdepend "=dev-ruby/spree_sample-3.1.3"
ruby_add_rdepend "=dev-ruby/spree_cmd-3.1.3"

