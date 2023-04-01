# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Irc bot based on Cinch"
HOMEPAGE="https://github.com/mose/cogbot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/cinch-2.2.4"
ruby_add_rdepend ">=dev-ruby/thor-0.19.1"
ruby_add_rdepend "=dev-ruby/eventmachine-1.0.7"
ruby_add_rdepend ">=dev-ruby/eventmachine_httpserver-0.2.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.6"
ruby_add_rdepend ">=dev-ruby/daemons-1.1.9"
ruby_add_rdepend ">=dev-ruby/twitter-5.13.0"
ruby_add_rdepend ">=dev-ruby/json-1.8.2"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.2.1"
ruby_add_rdepend ">=dev-ruby/fortune_gem-0.0.8"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/minitest-ci-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/simplecov-rcov-0"
ruby_add_rdepend ">=dev-ruby/flog-0"

