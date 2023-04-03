# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Poltergeist is a driver for Capybara that allows you to run your tests on a headless WebKit browser, provided by PhantomJS."
HOMEPAGE="http://github.com/jonleighton/poltergeist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/capybara-2.1"
ruby_add_rdepend ">=dev-ruby/websocket-driver-0.2.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"
ruby_add_rdepend ">=dev-ruby/cliver-0.3.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.12"
ruby_add_rdepend ">=dev-ruby/sinatra-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/image_size-1.0"
ruby_add_rdepend ">=dev-ruby/pdf-reader-1.3.3"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2.0"
ruby_add_rdepend ">=dev-ruby/guard-coffeescript-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-rerun-0.1"

