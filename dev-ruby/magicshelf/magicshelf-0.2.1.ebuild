# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="zip/rar to mobi (via epub) converter and serve files from web interface"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-doc-0"
ruby_add_rdepend ">=dev-ruby/pry-rescue-0"
ruby_add_rdepend ">=dev-ruby/shotgun-0"
ruby_add_rdepend ">=dev-ruby/foreman-0"
ruby_add_rdepend ">=dev-ruby/test-unit-3.1.2"
ruby_add_rdepend ">=dev-ruby/gepub-0.7.0"
ruby_add_rdepend ">=dev-ruby/resque-0"
ruby_add_rdepend ">=dev-ruby/ruby-filemagic-0"
ruby_add_rdepend ">=dev-ruby/rubyzip-0"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-0"
ruby_add_rdepend ">=dev-ruby/naturally-1.4.0"
ruby_add_rdepend ">=dev-ruby/rmagick-0"

