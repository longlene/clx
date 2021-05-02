# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sinatra extension providing RDiscount templates for Sinatra application"
HOMEPAGE="http://github.com/wbzyl/sinatra-rdiscount"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0.9"
ruby_add_rdepend ">=dev-ruby/erubis-2.6.5"
ruby_add_rdepend ">=dev-ruby/rdiscount-1.5.8"
ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.3"

