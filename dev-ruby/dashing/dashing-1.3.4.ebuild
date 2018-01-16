# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This framework lets you build & easily layout dashboards with your own custom widgets"
HOMEPAGE="http://shopify.github.com/dashing"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.2.12"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2.0"
ruby_add_rdepend ">=dev-ruby/execjs-2.0.2"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.4"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-1.4.2"
ruby_add_rdepend ">=dev-ruby/thin-1.6.1"
ruby_add_rdepend ">=dev-ruby/rufus-scheduler-2.0.24"
ruby_add_rdepend ">=dev-ruby/thor-0.18.1"
ruby_add_rdepend ">=dev-ruby/sprockets-2.10.1"
ruby_add_rdepend ">=dev-ruby/rack-1.5.2"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/haml-4.0.4"
ruby_add_rdepend ">=dev-ruby/minitest-5.2.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"
ruby_add_rdepend ">=dev-ruby/fakeweb-1.3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8.2"

