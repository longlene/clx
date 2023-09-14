# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Use Mustache in your Sinatra app without extra view classes"
HOMEPAGE="http://github.com/beatrichartz/sinatra-mustache"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.3"
ruby_add_rdepend ">=dev-ruby/mustache-0.99"
ruby_add_rdepend ">=dev-ruby/tilt-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-2"
ruby_add_rdepend ">=dev-ruby/rack-test-0"

