# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A static site generator based on Sinatra"
HOMEPAGE="http://middlemanapp.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.3.5"
ruby_add_rdepend ">=dev-ruby/thin-1.2.11"
ruby_add_rdepend ">=dev-ruby/thor-0.14.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.3.1"
ruby_add_rdepend ">=dev-ruby/maruku-0.6.0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3.1"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.1"
ruby_add_rdepend ">=dev-ruby/uglifier-1.2"
ruby_add_rdepend ">=dev-ruby/slim-1.0.2"
ruby_add_rdepend ">=dev-ruby/haml-3.1.0"
ruby_add_rdepend ">=dev-ruby/sass-3.1.7"
ruby_add_rdepend ">=dev-ruby/compass-0.11"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2.0"
ruby_add_rdepend ">=dev-ruby/execjs-1.2.7"
ruby_add_rdepend ">=dev-ruby/sprockets-2.0.3"
ruby_add_rdepend "=dev-ruby/padrino-core-0.10.6"
ruby_add_rdepend "=dev-ruby/padrino-helpers-0.10.6"
ruby_add_rdepend ">=dev-ruby/guard-1.1.0"
ruby_add_rdepend ">=dev-ruby/middleman-livereload-0.2.2"
ruby_add_rdepend ">=dev-ruby/coffee-filter-0.1.1"
ruby_add_rdepend ">=dev-ruby/liquid-2.2.0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.0.2"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"

