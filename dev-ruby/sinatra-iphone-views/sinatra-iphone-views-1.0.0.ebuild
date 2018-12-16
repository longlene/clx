# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Detects an iPhone/iPod browser and renders templates in views/iphone automatically"
HOMEPAGE="http://github.com/juliocesar/sinatra-iphone-views"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.3"
ruby_add_rdepend ">=dev-ruby/haml-2.2.17"

